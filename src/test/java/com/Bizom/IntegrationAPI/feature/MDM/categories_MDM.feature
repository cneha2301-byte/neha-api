@CategoriesMDM @MDM @Execution

Feature: All testcases of Categories MDM

  Description: This MDM ('Categories') is designed for managing product categories. It supports both creating new category records and updating existing ones. Key functionalities include ensuring unique category names and ERP IDs, validating string lengths for various fields, and setting default values for status and visibility.

  # --- 1. Mandatory Fields - Positive Scenarios ---

  @CategoriesTest1
  Scenario: CategoriesMDM:CategoriesTest1 - Successful upload of new category data with only mandatory field 'name'
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_categories_MDM" payload
      | JPath        | Value        |
      | data[0].name | randomString |
      | data[1].name | randomString |
    When I post the request with "insertMdmData_categories_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
    And verify response time is less than "10000" milliseconds

  @CategoriesTest2
  Scenario: CategoriesMDM:CategoriesTest2 - Not passing mandatory fields
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_categories_MDM" payload
      | JPath                      | Value              |
      | data[0].is_active          | 1                  |
      | data[0].isvisible_retailer | 1                  |
      | data[0].erp_id             | randomAlphaNumeric |
      | data[1].is_active          | 1                  |
      | data[1].isvisible_retailer | 1                  |
      | data[1].erp_id             | randomAlphaNumeric |
    When I post the request with "insertMdmData_categories_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath             | Value                                             |
      | Result            | false                                             |
      | Reason.1[0].Error | The name is required for creating the Categories. |
      | Reason.1[0].Error | The name is required for creating the Categories. |

    And verify response time is less than "10000" milliseconds

  @CategoriesTest3
  Scenario: CategoriesMDM:CategoriesTest3 - Data verificatiob by passing the vaili data in all the fields -for upload
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_categories_MDM" payload
      | JPath                          | Value           |
      | data[0].name                   | randomString    |
      | data[0].company_id             | DB:companies:id |
      | data[0].is_active              | 1               |
      | data[0].status                 | 1               |
      | data[0].special                | 1               |
      | data[0].type                   | randomString    |
      | data[0].category_sequence      | 1               |
      | data[0].invisible_retailer     | 1               |
      | data[0].disable_purchase_limit | 1               |
      | data[0].erp_id                 | randomString    |
      | data[1].name                   | randomString    |
      | data[1].company_id             | DB:companies:id |
      | data[1].is_active              | 1               |
      | data[1].status                 | 1               |
      | data[1].special                | 1               |
      | data[1].type                   | randomString    |
      | data[1].category_sequence      | 1               |
      | data[1].invisible_retailer     | 1               |
      | data[1].disable_purchase_limit | 1               |
      | data[1].erp_id                 | randomString    |
    When I post the request with "insertMdmData_categories_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                                            | expectedValue |
      | DB:categories:name: id=(SELECT MAX(id)-1 FROM categories)                 | randomString  |
      | DB:categories:company_id: id=(SELECT MAX(id)-1 FROM categories)           | randomString  |
      | DB:categories:is_active: id=(SELECT MAX(id) FROM categories)              | true          |
      | DB:categories:status: id=(SELECT MAX(id) FROM categories)                 | true          |
      | DB:categories:special: id=(SELECT MAX(id) FROM categories)                | true          |
      | DB:categories:type: id=(SELECT MAX(id) FROM categories)                   | randomString  |
      | DB:categories:category_sequence: id=(SELECT MAX(id) FROM categories)      | 1             |
      | DB:categories:isvisible_retailer: id=(SELECT MAX(id) FROM categories)     | true          |
      | DB:categories:disable_purchase_limit: id=(SELECT MAX(id) FROM categories) | 1             |
      | DB:categories:erp_id: id=(SELECT MAX(id) FROM categories)                 | randomString  |
    And verify response time is less than "10000" milliseconds

  @CategoriesTest4
  Scenario: CategoriesMDM:CategoriesTest4 - Data verificatiob by passing the vaili data in all the fields
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_categories_MDM" payload
      | JPath                          | Value                                               |
      | data[0].category_id            | DB:categories:id:id=(SELECT MAX(id)-1 FROM categories) |
      | data[0].name                   | randomString                                        |
      | data[0].company_id             | DB:companies:id                                     |
      | data[0].is_active              | 0                                                   |
      | data[0].status                 | 0                                                   |
      | data[0].special                | 0                                                   |
      | data[0].type                   | randomString                                        |
      | data[0].category_sequence      | 0                                                   |
      | data[0].isvisible_retailer     | 0                                                   |
      | data[0].disable_purchase_limit | 2                                                   |
      | data[1].category_id            | DB:categories:id:id=(SELECT MAX(id) FROM categories)   |
      | data[0].erp_id                 | randomString                                        |
      | data[1].name                   | randomString                                        |
      | data[1].company_id             | DB:companies:id                                     |
      | data[1].is_active              | 0                                                   |
      | data[1].status                 | 0                                                   |
      | data[1].special                | 0                                                   |
      | data[1].type                   | randomString                                        |
      | data[1].category_sequence      | 0                                                   |
      | data[1].isvisible_retailer     | 0                                                   |
      | data[1].disable_purchase_limit | 2                                                   |
      | data[1].erp_id                 | randomString                                        |
    When I post the request with "insertMdmData_categories_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                                              | expectedValue |
      | DB:categories:name: id=(SELECT MAX(id)-1 FROM categories)                   | randomString  |
      | DB:categories:is_active: id=(SELECT MAX(id)-1 FROM categories)              | false         |
      | DB:categories:status: id=(SELECT MAX(id)-1 FROM categories)                 | false         |
      | DB:categories:special: id=(SELECT MAX(id)-1 FROM categories)                | false         |
      | DB:categories:type: id=(SELECT MAX(id)-1 FROM categories)                   | randomString  |
      | DB:categories:category_sequence: id=(SELECT MAX(id)-1 FROM categories)      | 0             |
      | DB:categories:isvisible_retailer: id=(SELECT MAX(id)-1 FROM categories)     | false         |
      | DB:categories:disable_purchase_limit: id=(SELECT MAX(id)-1 FROM categories) | 2             |
      | DB:categories:erp_id: id=(SELECT MAX(id)-1 FROM categories)                 | randomString  |
      | DB:categories:name: id=(SELECT MAX(id) FROM categories)                     | randomString  |
      | DB:categories:is_active: id=(SELECT MAX(id) FROM categories)                | false         |
      | DB:categories:status: id=(SELECT MAX(id)-1 FROM categories)                 | false         |
      | DB:categories:special: id=(SELECT MAX(id) FROM categories)                  | false         |
      | DB:categories:type: id=(SELECT MAX(id) FROM categories)                     | randomString  |
      | DB:categories:category_sequence: id=(SELECT MAX(id) FROM categories)        | 0             |
      | DB:categories:isvisible_retailer: id=(SELECT MAX(id) FROM categories)       | false         |
      | DB:categories:disable_purchase_limit: id=(SELECT MAX(id) FROM categories)   | 2             |
      | DB:categories:erp_id: id=(SELECT MAX(id) FROM categories)                   | randomString  |
    And verify response time is less than "10000" milliseconds


  # --- Name field ---

  @CategoriesTest5
  Scenario: CategoriesMDM:CategoriesTest5 - Valid values into name field
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_categories_MDM" payload
      | JPath        | Value        |
      | data[0].name | randomString |
      | data[1].name | randomDouble |
    When I post the request with "insertMdmData_categories_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And verify response time is less than "10000" milliseconds

  @CategoriesTest6
  Scenario: CategoriesMDM:CategoriesTest6 - Valid values into name field
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_categories_MDM" payload
      | JPath        | Value                 |
      | data[0].name | randomAlphaNumeric    |
      | data[1].name | randomAsciiCharacters |
    When I post the request with "insertMdmData_categories_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And verify response time is less than "10000" milliseconds

  # Name field validations

  @CategoriesTest7
  Scenario: CategoriesMDM:CategoriesTest7 - Duplicate category name within the uploaded data (negative)
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_categories_MDM" payload
      | JPath        | Value              |
      | data[0].name | DB:categories:name |
      | data[1].name | DB:categories:name |
    When I post the request with "insertMdmData_categories_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath             | Value                              |
      | Result            | false                              |
      | Reason.1[0].Error | Name already exists in the system. |
      | Reason.2[0].Error | Name already exists in the system. |
    And verify response time is less than "10000" milliseconds


  @CategoriesTest8
  Scenario: CategoriesMDM:CategoriesTest8 - Category name  maximum length (255 characters) (positive)
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_categories_MDM" payload
      | JPath        | Value            |
      | data[0].name | randomString:255 |
      | data[1].name | randomString:255 |
    When I post the request with "insertMdmData_categories_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And verify response time is less than "10000" milliseconds

  @CategoriesTest9
  Scenario: CategoriesMDM:CategoriesTest9 - Category name exceeding maximum length (>255 characters) (positive)
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_categories_MDM" payload
      | JPath        | Value            |
      | data[0].name | randomString:256 |
      | data[1].name | randomString:256 |
    When I post the request with "insertMdmData_categories_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath  | Value |
      | Result | false |
    And verify response time is less than "3000" milliseconds


  @CategoriesTest10
  Scenario: CategoriesMDM:CategoriesTest10 - Empty name field in update scenario (negative)
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_categories_MDM" payload
      | JPath        | Value                        |
      | data[0].id   | DB:categories:id:is_active=1 |
      | data[0].name |                              |
    When I post the request with "insertMdmData_categories_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath  | Value |
      | Result | false |
    And verify response time is less than "10000" milliseconds

  # Company_id field validations

  @CategoriesTest11 @CategoriesBugFix
  Scenario: CategoriesMDM:CategoriesTest11 - Company ID with invalid format (non-numeric) (negative)
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_categories_MDM" payload
      | JPath              | Value        |
      | data[0].name       | randomString |
      | data[0].company_id | randomString |
      | data[1].name       | randomString |
      | data[1].company_id | randomDouble |
    When I post the request with "insertMdmData_categories_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath  | Value |
      | Result | false |
    And verify response time is less than "10000" milliseconds

  # ERP_ID field validations

  @CategoriesTest12
  Scenario: CategoriesMDM:CategoriesTest12 - Valid Values for ERP_ID
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_categories_MDM" payload
      | JPath          | Value        |
      | data[0].name   | randomString |
      | data[0].erp_id | randomString |
      | data[1].name   | randomString |
      | data[1].erp_id | randomDouble |
    When I post the request with "insertMdmData_categories_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                                 | expectedValue |
      | DB:categories:erp_id:id = (SELECT MAX(id) - 1 FROM categories) | randomString  |
      | DB:categories:erp_id:id = (SELECT MAX(id) FROM categories)     | randomString  |
    And verify response time is less than "10000" milliseconds

  @CategoriesTest13
  Scenario: CategoriesMDM:CategoriesTest13 - Valid Values for ERP_ID
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_categories_MDM" payload
      | JPath          | Value                 |
      | data[0].name   | randomString          |
      | data[0].erp_id | randomAlphaNumeric    |
      | data[1].name   | randomString          |
      | data[1].erp_id | randomAsciiCharacters |
    When I post the request with "insertMdmData_categories_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                                 | expectedValue |
      | DB:categories:erp_id:id = (SELECT MAX(id) - 1 FROM categories) | randomString  |
      | DB:categories:erp_id:id = (SELECT MAX(id) FROM categories)     | randomString  |
    And verify response time is less than "10000" milliseconds

  @CategoriesTest14
  Scenario: CategoriesMDM:CategoriesTest14 - ERP ID  maximum length (50 characters) (negative)
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_categories_MDM" payload
      | JPath          | Value           |
      | data[0].name   | randomString:50 |
      | data[0].erp_id | randomString:50 |
      | data[1].name   | randomString    |
      | data[1].erp_id | randomString:50 |
    When I post the request with "insertMdmData_categories_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                                 | expectedValue |
      | DB:categories:erp_id:id = (SELECT MAX(id) - 1 FROM categories) | randomString  |
      | DB:categories:erp_id:id = (SELECT MAX(id) FROM categories)     | randomString  |
    And verify response time is less than "10000" milliseconds

  @CategoriesTest15
  Scenario: CategoriesMDM:CategoriesTest15 - ERP ID  maximum length (>50 characters) (negative)
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_categories_MDM" payload
      | JPath          | Value                                               |
      | data[0].name   | randomString:50                                     |
      | data[0].erp_id | sToGYMngenSNvHEzetyXLqZzqhnAXfJmSEXuimivPcFWcvMuTOs |
      | data[1].name   | randomString                                        |
      | data[1].erp_id | sToGYMngenSNvHEzetyXLqZzqhnAXfJmSEXuimivPcFWcvMuTOs |
    When I post the request with "insertMdmData_categories_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath             | Value                                                                                         |
      | Result            | false                                                                                         |
      | Reason.1[0].Error | The value sToGYMngenSNvHEzetyXLqZzqhnAXfJmSEXuimivPcFWcvMuTOs should have maximum 50 letters. |
      | Reason.2[0].Error | The value sToGYMngenSNvHEzetyXLqZzqhnAXfJmSEXuimivPcFWcvMuTOs should have maximum 50 letters. |
    And verify response time is less than "10000" milliseconds

  @CategoriesTest16
  Scenario:Duplicate ERP id
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_categories_MDM" payload
      | JPath          | Value                                   |
      | data[0].name   | randomString:50                         |
      | data[0].erp_id | DB:categories:erp_id:erp_id IS NOT NULL |
      | data[1].name   | randomString                            |
      | data[1].erp_id | DB:categories:erp_id:erp_id IS NOT NULL |
    When I post the request with "insertMdmData_categories_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath             | Value                                |
      | Result            | false                                |
      | Reason.1[0].Error | Erp_id already exists in the system. |
      | Reason.2[0].Error | Erp_id already exists in the system. |
    And verify response time is less than "10000" milliseconds


  @CategoriesTest17
  Scenario: CategoriesMDM:CategoriesTest17 - Updating a category with a non-numeric ID (negative)
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_categories_MDM" payload
      | JPath               | Value        |
      | data[0].category_id | alphbets     |
      | data[0].name        | randomString |
      | data[1].category_id | -100         |
      | data[1].name        | randomString |
    When I post the request with "insertMdmData_categories_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath             | Value                                 |
      | Result            | false                                 |
      | Reason.1[0].Error | The value alphbets should be numeric. |
      | Reason.2[0].Error | The id entered does not exists.       |

    And verify response time is less than "10000" milliseconds

  # Is_active and Isvisible_retailer field validations
  @CategoriesTest18
  Scenario: CategoriesMDM:CategoriesTest18 - Valid Values for Is_active , status and invisible retailer column
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_categories_MDM" payload
      | JPath                      | Value        |
      | data[0].name               | randomString |
      | data[0].is_active          | 1            |
      | data[0].status             | 1            |
      | data[0].isvisible_retailer | 1            |
      | JPath                      | Value        |
      | data[1].name               | randomString |
      | data[1].is_active          | 0            |
      | data[1].status             | 0            |
      | data[1].isvisible_retailer | 0            |
    When I post the request with "insertMdmData_categories_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                                          | expectedValue |
      | DB:categories:is_active: id=(SELECT MAX(id)-1 FROM categories)          | true          |
      | DB:categories:status: id=(SELECT MAX(id)-1 FROM categories)             | true          |
      | DB:categories:isvisible_retailer: id=(SELECT MAX(id)-1 FROM categories) | true          |
      | DB:categories:is_active: id=(SELECT MAX(id) FROM categories)            | false         |
      | DB:categories:status: id=(SELECT MAX(id) FROM categories)               | false         |
      | DB:categories:isvisible_retailer: id=(SELECT MAX(id) FROM categories)   | false         |
    And verify response time is less than "10000" milliseconds

  @CategoriesTest19
  Scenario: CategoriesMDM:CategoriesTest19 - invalid values into is_active,status,isvisible_retailer
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_categories_MDM" payload
      | JPath                      | Value        |
      | data[0].name               | randomString |
      | data[0].is_active          | 2            |
      | data[0].status             | 2            |
      | data[0].isvisible_retailer | 2            |
      | JPath                      | Value        |
      | data[1].name               | randomString |
      | data[1].is_active          | -1           |
      | data[1].status             | -1           |
      | data[1].isvisible_retailer | -1           |
    When I post the request with "insertMdmData_categories_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath              | Value                    |
      | Result             | false                    |
      | Reason.1[0].Column | is_active                |
      | Reason.1[0].Row    | 1                        |
      | Reason.1[0].Error  | Only 1 or 0 is accepted. |
      | Reason.1[1].Column | status                   |
      | Reason.1[1].Row    | 1                        |
      | Reason.1[1].Error  | Only 1 or 0 is accepted. |
      | Reason.1[2].Column | isvisible_retailer       |
      | Reason.1[2].Row    | 1                        |
      | Reason.1[2].Error  | Only 1 or 0 is accepted. |
      | Reason.2[0].Column | is_active                |
      | Reason.2[0].Row    | 1                        |
      | Reason.2[0].Error  | Only 1 or 0 is accepted. |
      | Reason.2[1].Column | status                   |
      | Reason.2[1].Row    | 1                        |
      | Reason.2[1].Error  | Only 1 or 0 is accepted. |
      | Reason.2[2].Column | isvisible_retailer       |
      | Reason.2[2].Row    | 1                        |
      | Reason.2[2].Error  | Only 1 or 0 is accepted. |
    And verify response time is less than "10000" milliseconds

  @CategoriesTest20
  Scenario: CategoriesMDM:CategoriesTest20 - invalid values into is_active,status,isvisible_retailer
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_categories_MDM" payload
      | JPath                      | Value                 |
      | data[0].name               | randomString          |
      | data[0].is_active          | randomString          |
      | data[0].status             | randomString          |
      | data[0].isvisible_retailer | randomString          |
      | JPath                      | Value                 |
      | data[1].name               | randomString          |
      | data[1].is_active          | randomAsciiCharacters |
      | data[1].status             | randomAsciiCharacters |
      | data[1].isvisible_retailer | randomAsciiCharacters |
    When I post the request with "insertMdmData_categories_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath              | Value                    |
      | Result             | false                    |
      | Reason.1[0].Column | is_active                |
      | Reason.1[0].Row    | 1                        |
      | Reason.1[0].Error  | Only 1 or 0 is accepted. |
      | Reason.1[1].Column | status                   |
      | Reason.1[1].Row    | 1                        |
      | Reason.1[1].Error  | Only 1 or 0 is accepted. |
      | Reason.1[2].Column | isvisible_retailer       |
      | Reason.1[2].Row    | 1                        |
      | Reason.1[2].Error  | Only 1 or 0 is accepted. |
      | Reason.2[0].Column | is_active                |
      | Reason.2[0].Row    | 1                        |
      | Reason.2[0].Error  | Only 1 or 0 is accepted. |
      | Reason.2[1].Column | status                   |
      | Reason.2[1].Row    | 1                        |
      | Reason.2[1].Error  | Only 1 or 0 is accepted. |
      | Reason.2[2].Column | isvisible_retailer       |
      | Reason.2[2].Row    | 1                        |
      | Reason.2[2].Error  | Only 1 or 0 is accepted. |
    And verify response time is less than "10000" milliseconds

  @CategoriesTest21
  Scenario: CategoriesMDM:CategoriesTest21 - Valid Values for special values
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_categories_MDM" payload
      | JPath           | Value        |
      | data[0].name    | randomString |
      | data[0].special | 1            |
      | data[1].name    | randomString |
      | data[1].special | 0            |
    When I post the request with "insertMdmData_categories_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                               | expectedValue |
      | DB:categories:special: id=(SELECT MAX(id)-1 FROM categories) | true          |
      | DB:categories:status: id=(SELECT MAX(id) FROM categories)    | false         |
      | DB:categories:special: id=(SELECT MAX(id) FROM categories)   | false         |
    And verify response time is less than "10000" milliseconds

  @CategoriesTest22
  Scenario: CategoriesMDM:CategoriesTest22 - invalid values into is_active,status,isvisible_retailer
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_categories_MDM" payload
      | JPath           | Value                 |
      | data[0].name    | randomString          |
      | data[0].special | randomString          |
      | data[1].name    | randomString          |
      | data[1].special | randomAsciiCharacters |
    When I post the request with "insertMdmData_categories_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath              | Value                    |
      | Result             | false                    |
      | Reason.1[0].Column | special                  |
      | Reason.1[0].Row    | 1                        |
      | Reason.1[0].Error  | Only 1 or 0 is accepted. |
      | Reason.2[0].Column | special                  |
      | Reason.2[0].Row    | 1                        |
      | Reason.2[0].Error  | Only 1 or 0 is accepted. |
    And verify response time is less than "10000" milliseconds

  @CategoriesTest23
  Scenario: CategoriesMDM:CategoriesTest23 - Valid Values for special values
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_categories_MDM" payload
      | JPath           | Value        |
      | data[0].name    | randomString |
      | data[0].special | 1            |
      | data[1].name    | randomString |
      | data[1].special | 0            |
    When I post the request with "insertMdmData_categories_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                               | expectedValue |
      | DB:categories:special: id=(SELECT MAX(id)-1 FROM categories) | true          |
      | DB:categories:status: id=(SELECT MAX(id) FROM categories)    | false         |
      | DB:categories:special: id=(SELECT MAX(id) FROM categories)   | false         |
    And verify response time is less than "10000" milliseconds

  @CategoriesTest24
  Scenario: CategoriesMDM:CategoriesTest24 - invalid values for special column
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_categories_MDM" payload
      | JPath           | Value        |
      | data[0].name    | randomString |
      | data[0].special | randomInt    |
      | data[1].name    | randomString |
      | data[1].special | randomDouble |
    When I post the request with "insertMdmData_categories_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath              | Value                    |
      | Result             | false                    |
      | Reason.1[0].Column | special                  |
      | Reason.1[0].Row    | 1                        |
      | Reason.1[0].Error  | Only 1 or 0 is accepted. |
      | Reason.2[0].Column | special                  |
      | Reason.2[0].Row    | 1                        |
      | Reason.2[0].Error  | Only 1 or 0 is accepted. |
    And verify response time is less than "10000" milliseconds

  @CategoriesTest25
  Scenario: CategoriesMDM:CategoriesTest25 - Valid values for type column
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_categories_MDM" payload
      | JPath        | Value        |
      | data[0].name | randomString |
      | data[0].type | randomString |
      | data[1].name | randomString |
      | data[1].type | randomString |
    When I post the request with "insertMdmData_categories_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                                        | expectedValue |
      | DB:categories:name: id=(SELECT MAX(id)-1 FROM categories)             | randomString  |
      | DB:categories:type: id=(SELECT MAX(id)-1 FROM categories)             | randomString  |
      | DB:categories:status: id=(SELECT MAX(id) FROM categories)             | randomString  |
      | DB:categories:isvisible_retailer: id=(SELECT MAX(id) FROM categories) | randomString  |
    And verify response time is less than "10000" milliseconds

  @CategoriesTest26
  Scenario: CategoriesMDM:CategoriesTest26 - Valid values for type column
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_categories_MDM" payload
      | JPath        | Value                 |
      | data[0].name | randomString          |
      | data[0].type | randomDouble          |
      | data[1].name | randomString          |
      | data[1].type | randomAsciiCharacters |
    When I post the request with "insertMdmData_categories_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                            | expectedValue |
      | DB:categories:name: id=(SELECT MAX(id)-1 FROM categories) | randomString  |
      | DB:categories:type: id=(SELECT MAX(id)-1 FROM categories) | randomString  |
      | DB:categories:name: id=(SELECT MAX(id) FROM categories)   | randomString  |
      | DB:categories:type: id=(SELECT MAX(id) FROM categories)   | randomString  |
    And verify response time is less than "10000" milliseconds

  @CategoriesTest27
  Scenario: CategoriesMDM:CategoriesTest27 - Boundary Valid values for type column
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_categories_MDM" payload
      | JPath        | Value            |
      | data[0].name | randomString     |
      | data[0].type | randomString:255 |
      | data[1].name | randomString     |
      | data[1].type | randomString:255 |
    When I post the request with "insertMdmData_categories_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                            | expectedValue |
      | DB:categories:name: id=(SELECT MAX(id)-1 FROM categories) | randomString  |
      | DB:categories:type: id=(SELECT MAX(id)-1 FROM categories) | randomString  |
      | DB:categories:name: id=(SELECT MAX(id) FROM categories)   | randomString  |
      | DB:categories:type: id=(SELECT MAX(id) FROM categories)   | randomString  |
    And verify response time is less than "10000" milliseconds

  @CategoriesTest28
  Scenario: CategoriesMDM:CategoriesTest28 - Boundary Valid values for type column ->100 characters
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_categories_MDM" payload
      | JPath        | Value            |
      | data[0].name | randomString     |
      | data[0].type | randomString:256 |
      | data[1].name | randomString     |
      | data[1].type | randomString:256 |
    When I post the request with "insertMdmData_categories_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath              | Value |
      | Result             | false |
      | Reason.1[0].Column | type  |
      | Reason.2[0].Column | type  |
    And verifies the field is present in the response
      | JPath             |
      | Result            |
      | Reason.1[0].Error |
      | Reason.2[0].Error |
    And verify response time is less than "10000" milliseconds

  @CategoriesTest29
  Scenario: CategoriesMDM:CategoriesTest29 - Boundary Valid values for type column =256 characters
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_categories_MDM" payload
      | JPath            | Value            |
      | data[0].name     | randomString     |
      | data[0].imageurl | randomString:256 |
      | data[1].name     | randomString     |
      | data[1].imageurl | randomString:256 |
    When I post the request with "insertMdmData_categories_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                                | expectedValue |
      | DB:categories:name: id=(SELECT MAX(id)-1 FROM categories)     | randomString  |
      | DB:categories:imageurl: id=(SELECT MAX(id)-1 FROM categories) | randomString  |
      | DB:categories:name: id=(SELECT MAX(id) FROM categories)       | randomString  |
      | DB:categories:imageurl: id=(SELECT MAX(id) FROM categories)   | randomString  |
    And verify response time is less than "10000" milliseconds
  @CategoriesTest30
  Scenario: CategoriesMDM:CategoriesTest30 - Boundary Valid values for type column =256 characters
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_categories_MDM" payload
      | JPath            | Value            |
      | data[0].name     | randomString     |
      | data[0].imageurl | randomString:257 |
      | data[1].name     | randomString     |
      | data[1].imageurl | randomString:257 |
    When I post the request with "insertMdmData_categories_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | false                       |
      | Reason.1[0].Column | imageurl  |
      | Reason.2[0].Column | imageurl  |
    And verifies the field is present in the response
      | JPath             |
      | Result            |
      | Reason.1[0].Error |
      | Reason.2[0].Error |
    And verify response time is less than "10000" milliseconds

  @CategoriesTest31
  Scenario: CategoriesMDM:CategoriesTest31 - Successful upload of new category data with only mandatory field 'name' for bulk upload
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertBulkMdmData_categories_MDM" payload
      | JPath             | Value        |
      | data[0].name      | randomString |
      | data[0].is_active | 1            |
      | data[1].name      | randomString |
      | data[1].is_active | 1            |
      | data[2].name      | randomString |
      | data[2].is_active | 1            |
      | data[3].name      | randomString |
      | data[3].is_active | 1            |
      | data[4].name      | randomString |
      | data[4].is_active | 1            |
      | data[5].name      | randomString |
      | data[5].is_active | 1            |
      | data[6].name      | randomString |
      | data[6].is_active | 1            |
      | data[7].name      | randomString |
      | data[7].is_active | 1            |
      | data[8].name      | randomString |
      | data[8].is_active | 1            |
      | data[9].name      | randomString |
      | data[9].is_active | 1            |
      | data[10].name      | randomString |
      | data[10].is_active | 1            |
      | data[11].name      | randomString |
      | data[11].is_active | 1            |
      | data[12].name      | randomString |
      | data[12].is_active | 1            |
      | data[13].name      | randomString |
      | data[13].is_active | 1            |
      | data[14].name      | randomString |
      | data[14].is_active | 1            |
      | data[15].name      | randomString |
      | data[15].is_active | 1            |
      | data[16].name      | randomString |
      | data[16].is_active | 1            |
      | data[17].name      | randomString |
      | data[17].is_active | 1            |
      | data[18].name      | randomString |
      | data[18].is_active | 1            |
      | data[19].name      | randomString |
      | data[19].is_active | 1            |
      | data[20].name      | randomString |
      | data[20].is_active | 1            |
      | data[21].name      | randomString |
      | data[21].is_active | 1            |
      | data[22].name      | randomString |
      | data[22].is_active | 1            |
      | data[23].name      | randomString |
      | data[23].is_active | 1            |
      | data[24].name      | randomString |
      | data[24].is_active | 1            |
      | data[25].name      | randomString |
      | data[25].is_active | 1            |
      | data[26].name      | randomString |
      | data[26].is_active | 1            |
      | data[27].name      | randomString |
      | data[27].is_active | 1            |
      | data[28].name      | randomString |
      | data[28].is_active | 1            |
      | data[29].name      | randomString |
      | data[29].is_active | 1            |
      | data[30].name      | randomString |
      | data[30].is_active | 1            |
      | data[31].name      | randomString |
      | data[31].is_active | 1            |
      | data[32].name      | randomString |
      | data[32].is_active | 1            |
      | data[33].name      | randomString |
      | data[33].is_active | 1            |
      | data[34].name      | randomString |
      | data[34].is_active | 1            |
      | data[35].name      | randomString |
      | data[35].is_active | 1            |
      | data[36].name      | randomString |
      | data[36].is_active | 1            |
      | data[37].name      | randomString |
      | data[37].is_active | 1            |
      | data[38].name      | randomString |
      | data[38].is_active | 1            |
      | data[39].name      | randomString |
      | data[39].is_active | 1            |
      | data[40].name      | randomString |
      | data[40].is_active | 1            |
      | data[41].name      | randomString |
      | data[41].is_active | 1            |
      | data[42].name      | randomString |
      | data[42].is_active | 1            |
      | data[43].name      | randomString |
      | data[43].is_active | 1            |
      | data[44].name      | randomString |
      | data[44].is_active | 1            |
      | data[45].name      | randomString |
      | data[45].is_active | 1            |
      | data[46].name      | randomString |
      | data[46].is_active | 1            |
      | data[47].name      | randomString |
      | data[47].is_active | 1            |
      | data[48].name      | randomString |
      | data[48].is_active | 1            |
      | data[49].name      | randomString |
      | data[49].is_active | 1            |
      | data[50].name      | randomString |
      | data[50].is_active | 1            |
      | data[51].name      | randomString |
      | data[51].is_active | 1            |
      | data[52].name      | randomString |
      | data[52].is_active | 1            |
      | data[53].name      | randomString |
      | data[53].is_active | 1            |
      | data[54].name      | randomString |
      | data[54].is_active | 1            |
      | data[55].name      | randomString |
      | data[55].is_active | 1            |
      | data[56].name      | randomString |
      | data[56].is_active | 1            |
      | data[57].name      | randomString |
      | data[57].is_active | 1            |
      | data[58].name      | randomString |
      | data[58].is_active | 1            |
      | data[59].name      | randomString |
      | data[59].is_active | 1            |
      | data[60].name      | randomString |
      | data[60].is_active | 1            |
      | data[61].name      | randomString |
      | data[61].is_active | 1            |
      | data[62].name      | randomString |
      | data[62].is_active | 1            |
      | data[63].name      | randomString |
      | data[63].is_active | 1            |
      | data[64].name      | randomString |
      | data[64].is_active | 1            |
      | data[65].name      | randomString |
      | data[65].is_active | 1            |
      | data[66].name      | randomString |
      | data[66].is_active | 1            |
      | data[67].name      | randomString |
      | data[67].is_active | 1            |
      | data[68].name      | randomString |
      | data[68].is_active | 1            |
      | data[69].name      | randomString |
      | data[69].is_active | 1            |
      | data[70].name      | randomString |
      | data[70].is_active | 1            |
      | data[71].name      | randomString |
      | data[71].is_active | 1            |
      | data[72].name      | randomString |
      | data[72].is_active | 1            |
      | data[73].name      | randomString |
      | data[73].is_active | 1            |
      | data[74].name      | randomString |
      | data[74].is_active | 1            |
      | data[75].name      | randomString |
      | data[75].is_active | 1            |
      | data[76].name      | randomString |
      | data[76].is_active | 1            |
      | data[77].name      | randomString |
      | data[77].is_active | 1            |
      | data[78].name      | randomString |
      | data[78].is_active | 1            |
      | data[79].name      | randomString |
      | data[79].is_active | 1            |
      | data[80].name      | randomString |
      | data[80].is_active | 1            |
      | data[81].name      | randomString |
      | data[81].is_active | 1            |
      | data[82].name      | randomString |
      | data[82].is_active | 1            |
      | data[83].name      | randomString |
      | data[83].is_active | 1            |
      | data[84].name      | randomString |
      | data[84].is_active | 1            |
      | data[85].name      | randomString |
      | data[85].is_active | 1            |
      | data[86].name      | randomString |
      | data[86].is_active | 1            |
      | data[87].name      | randomString |
      | data[87].is_active | 1            |
      | data[88].name      | randomString |
      | data[88].is_active | 1            |
      | data[89].name      | randomString |
      | data[89].is_active | 1            |
      | data[90].name      | randomString |
      | data[90].is_active | 1            |
      | data[91].name      | randomString |
      | data[91].is_active | 1            |
      | data[92].name      | randomString |
      | data[92].is_active | 1            |
      | data[93].name      | randomString |
      | data[93].is_active | 1            |
      | data[94].name      | randomString |
      | data[94].is_active | 1            |
      | data[95].name      | randomString |
      | data[95].is_active | 1            |
      | data[96].name      | randomString |
      | data[96].is_active | 1            |
      | data[97].name      | randomString |
      | data[97].is_active | 1            |
      | data[98].name      | randomString |
      | data[98].is_active | 1            |
      | data[99].name      | randomString |
      | data[99].is_active | 1            |
      | data[100].name      | randomString |
      | data[100].is_active | 1            |
      | data[101].name      | randomString |
      | data[101].is_active | 1            |
      | data[102].name      | randomString |
      | data[102].is_active | 1            |
      | data[103].name      | randomString |
      | data[103].is_active | 1            |
      | data[104].name      | randomString |
      | data[104].is_active | 1            |
      | data[105].name      | randomString |
      | data[105].is_active | 1            |
      | data[106].name      | randomString |
      | data[106].is_active | 1            |
      | data[107].name      | randomString |
      | data[107].is_active | 1            |
      | data[108].name      | randomString |
      | data[108].is_active | 1            |
      | data[109].name      | randomString |
      | data[109].is_active | 1            |
      | data[110].name      | randomString |
      | data[110].is_active | 1            |
      | data[111].name      | randomString |
      | data[111].is_active | 1            |
      | data[112].name      | randomString |
      | data[112].is_active | 1            |
      | data[113].name      | randomString |
      | data[113].is_active | 1            |
      | data[114].name      | randomString |
      | data[114].is_active | 1            |
      | data[115].name      | randomString |
      | data[115].is_active | 1            |
      | data[116].name      | randomString |
      | data[116].is_active | 1            |
      | data[117].name      | randomString |
      | data[117].is_active | 1            |
      | data[118].name      | randomString |
      | data[118].is_active | 1            |
      | data[119].name      | randomString |
      | data[119].is_active | 1            |
      | data[120].name      | randomString |
      | data[120].is_active | 1            |
      | data[121].name      | randomString |
      | data[121].is_active | 1            |
      | data[122].name      | randomString |
      | data[122].is_active | 1            |
      | data[123].name      | randomString |
      | data[123].is_active | 1            |
      | data[124].name      | randomString |
      | data[124].is_active | 1            |
      | data[125].name      | randomString |
      | data[125].is_active | 1            |
      | data[126].name      | randomString |
      | data[126].is_active | 1            |
      | data[127].name      | randomString |
      | data[127].is_active | 1            |
      | data[128].name      | randomString |
      | data[128].is_active | 1            |
      | data[129].name      | randomString |
      | data[129].is_active | 1            |
      | data[130].name      | randomString |
      | data[130].is_active | 1            |
      | data[131].name      | randomString |
      | data[131].is_active | 1            |
      | data[132].name      | randomString |
      | data[132].is_active | 1            |
      | data[133].name      | randomString |
      | data[133].is_active | 1            |
      | data[134].name      | randomString |
      | data[134].is_active | 1            |
      | data[135].name      | randomString |
      | data[135].is_active | 1            |
      | data[136].name      | randomString |
      | data[136].is_active | 1            |
      | data[137].name      | randomString |
      | data[137].is_active | 1            |
      | data[138].name      | randomString |
      | data[138].is_active | 1            |
      | data[139].name      | randomString |
      | data[139].is_active | 1            |
      | data[140].name      | randomString |
      | data[140].is_active | 1            |
      | data[141].name      | randomString |
      | data[141].is_active | 1            |
      | data[142].name      | randomString |
      | data[142].is_active | 1            |
      | data[143].name      | randomString |
      | data[143].is_active | 1            |
      | data[144].name      | randomString |
      | data[144].is_active | 1            |
      | data[145].name      | randomString |
      | data[145].is_active | 1            |
      | data[146].name      | randomString |
      | data[146].is_active | 1            |
      | data[147].name      | randomString |
      | data[147].is_active | 1            |
      | data[148].name      | randomString |
      | data[148].is_active | 1            |
      | data[149].name      | randomString |
      | data[149].is_active | 1            |
      | data[150].name      | randomString |
      | data[150].is_active | 1            |
      | data[151].name      | randomString |
      | data[151].is_active | 1            |
      | data[152].name      | randomString |
      | data[152].is_active | 1            |
      | data[153].name      | randomString |
      | data[153].is_active | 1            |
      | data[154].name      | randomString |
      | data[154].is_active | 1            |
      | data[155].name      | randomString |
      | data[155].is_active | 1            |
      | data[156].name      | randomString |
      | data[156].is_active | 1            |
      | data[157].name      | randomString |
      | data[157].is_active | 1            |
      | data[158].name      | randomString |
      | data[158].is_active | 1            |
      | data[159].name      | randomString |
      | data[159].is_active | 1            |
      | data[160].name      | randomString |
      | data[160].is_active | 1            |
      | data[161].name      | randomString |
      | data[161].is_active | 1            |
      | data[162].name      | randomString |
      | data[162].is_active | 1            |
      | data[163].name      | randomString |
      | data[163].is_active | 1            |
      | data[164].name      | randomString |
      | data[164].is_active | 1            |
      | data[165].name      | randomString |
      | data[165].is_active | 1            |
      | data[166].name      | randomString |
      | data[166].is_active | 1            |
      | data[167].name      | randomString |
      | data[167].is_active | 1            |
      | data[168].name      | randomString |
      | data[168].is_active | 1            |
      | data[169].name      | randomString |
      | data[169].is_active | 1            |
      | data[170].name      | randomString |
      | data[170].is_active | 1            |
      | data[171].name      | randomString |
      | data[171].is_active | 1            |
      | data[172].name      | randomString |
      | data[172].is_active | 1            |
      | data[173].name      | randomString |
      | data[173].is_active | 1            |
      | data[174].name      | randomString |
      | data[174].is_active | 1            |
      | data[175].name      | randomString |
      | data[175].is_active | 1            |
      | data[176].name      | randomString |
      | data[176].is_active | 1            |
      | data[177].name      | randomString |
      | data[177].is_active | 1            |
      | data[178].name      | randomString |
      | data[178].is_active | 1            |
      | data[179].name      | randomString |
      | data[179].is_active | 1            |
      | data[180].name      | randomString |
      | data[180].is_active | 1            |
      | data[181].name      | randomString |
      | data[181].is_active | 1            |
      | data[182].name      | randomString |
      | data[182].is_active | 1            |
      | data[183].name      | randomString |
      | data[183].is_active | 1            |
      | data[184].name      | randomString |
      | data[184].is_active | 1            |
      | data[185].name      | randomString |
      | data[185].is_active | 1            |
      | data[186].name      | randomString |
      | data[186].is_active | 1            |
      | data[187].name      | randomString |
      | data[187].is_active | 1            |
      | data[188].name      | randomString |
      | data[188].is_active | 1            |
      | data[189].name      | randomString |
      | data[189].is_active | 1            |
      | data[190].name      | randomString |
      | data[190].is_active | 1            |
      | data[191].name      | randomString |
      | data[191].is_active | 1            |
      | data[192].name      | randomString |
      | data[192].is_active | 1            |
      | data[193].name      | randomString |
      | data[193].is_active | 1            |
      | data[194].name      | randomString |
      | data[194].is_active | 1            |
      | data[195].name      | randomString |
      | data[195].is_active | 1            |
      | data[196].name      | randomString |
      | data[196].is_active | 1            |
      | data[197].name      | randomString |
      | data[197].is_active | 1            |
      | data[198].name      | randomString |
      | data[198].is_active | 1            |
      | data[199].name      | randomString |
      | data[199].is_active | 1            |
      | data[200].name      | randomString |
      | data[200].is_active | 1            |
      | data[201].name      | randomString |
      | data[201].is_active | 1            |
      | data[202].name      | randomString |
      | data[202].is_active | 1            |
      | data[203].name      | randomString |
      | data[203].is_active | 1            |
      | data[204].name      | randomString |
      | data[204].is_active | 1            |
      | data[205].name      | randomString |
      | data[205].is_active | 1            |
      | data[206].name      | randomString |
      | data[206].is_active | 1            |
      | data[207].name      | randomString |
      | data[207].is_active | 1            |
      | data[208].name      | randomString |
      | data[208].is_active | 1            |
      | data[209].name      | randomString |
      | data[209].is_active | 1            |
      | data[210].name      | randomString |
      | data[210].is_active | 1            |
      | data[211].name      | randomString |
      | data[211].is_active | 1            |
      | data[212].name      | randomString |
      | data[212].is_active | 1            |
      | data[213].name      | randomString |
      | data[213].is_active | 1            |
      | data[214].name      | randomString |
      | data[214].is_active | 1            |
      | data[215].name      | randomString |
      | data[215].is_active | 1            |
      | data[216].name      | randomString |
      | data[216].is_active | 1            |
      | data[217].name      | randomString |
      | data[217].is_active | 1            |
      | data[218].name      | randomString |
      | data[218].is_active | 1            |
      | data[219].name      | randomString |
      | data[219].is_active | 1            |
      | data[220].name      | randomString |
      | data[220].is_active | 1            |
      | data[221].name      | randomString |
      | data[221].is_active | 1            |
      | data[222].name      | randomString |
      | data[222].is_active | 1            |
      | data[223].name      | randomString |
      | data[223].is_active | 1            |
      | data[224].name      | randomString |
      | data[224].is_active | 1            |
      | data[225].name      | randomString |
      | data[225].is_active | 1            |
      | data[226].name      | randomString |
      | data[226].is_active | 1            |
      | data[227].name      | randomString |
      | data[227].is_active | 1            |
      | data[228].name      | randomString |
      | data[228].is_active | 1            |
      | data[229].name      | randomString |
      | data[229].is_active | 1            |
      | data[230].name      | randomString |
      | data[230].is_active | 1            |
      | data[231].name      | randomString |
      | data[231].is_active | 1            |
      | data[232].name      | randomString |
      | data[232].is_active | 1            |
      | data[233].name      | randomString |
      | data[233].is_active | 1            |
      | data[234].name      | randomString |
      | data[234].is_active | 1            |
      | data[235].name      | randomString |
      | data[235].is_active | 1            |
      | data[236].name      | randomString |
      | data[236].is_active | 1            |
      | data[237].name      | randomString |
      | data[237].is_active | 1            |
      | data[238].name      | randomString |
      | data[238].is_active | 1            |
      | data[239].name      | randomString |
      | data[239].is_active | 1            |
      | data[240].name      | randomString |
      | data[240].is_active | 1            |
      | data[241].name      | randomString |
      | data[241].is_active | 1            |
      | data[242].name      | randomString |
      | data[242].is_active | 1            |
      | data[243].name      | randomString |
      | data[243].is_active | 1            |
      | data[244].name      | randomString |
      | data[244].is_active | 1            |
      | data[245].name      | randomString |
      | data[245].is_active | 1            |
      | data[246].name      | randomString |
      | data[246].is_active | 1            |
      | data[247].name      | randomString |
      | data[247].is_active | 1            |
      | data[248].name      | randomString |
      | data[248].is_active | 1            |
      | data[249].name      | randomString |
      | data[249].is_active | 1            |
      | data[250].name      | randomString |
      | data[250].is_active | 1            |
      | data[251].name      | randomString |
      | data[251].is_active | 1            |
      | data[252].name      | randomString |
      | data[252].is_active | 1            |
      | data[253].name      | randomString |
      | data[253].is_active | 1            |
      | data[254].name      | randomString |
      | data[254].is_active | 1            |
      | data[255].name      | randomString |
      | data[255].is_active | 1            |
      | data[256].name      | randomString |
      | data[256].is_active | 1            |
      | data[257].name      | randomString |
      | data[257].is_active | 1            |
      | data[258].name      | randomString |
      | data[258].is_active | 1            |
      | data[259].name      | randomString |
      | data[259].is_active | 1            |
      | data[260].name      | randomString |
      | data[260].is_active | 1            |
      | data[261].name      | randomString |
      | data[261].is_active | 1            |
      | data[262].name      | randomString |
      | data[262].is_active | 1            |
      | data[263].name      | randomString |
      | data[263].is_active | 1            |
      | data[264].name      | randomString |
      | data[264].is_active | 1            |
      | data[265].name      | randomString |
      | data[265].is_active | 1            |
      | data[266].name      | randomString |
      | data[266].is_active | 1            |
      | data[267].name      | randomString |
      | data[267].is_active | 1            |
      | data[268].name      | randomString |
      | data[268].is_active | 1            |
      | data[269].name      | randomString |
      | data[269].is_active | 1            |
      | data[270].name      | randomString |
      | data[270].is_active | 1            |
      | data[271].name      | randomString |
      | data[271].is_active | 1            |
      | data[272].name      | randomString |
      | data[272].is_active | 1            |
      | data[273].name      | randomString |
      | data[273].is_active | 1            |
      | data[274].name      | randomString |
      | data[274].is_active | 1            |
      | data[275].name      | randomString |
      | data[275].is_active | 1            |
      | data[276].name      | randomString |
      | data[276].is_active | 1            |
      | data[277].name      | randomString |
      | data[277].is_active | 1            |
      | data[278].name      | randomString |
      | data[278].is_active | 1            |
      | data[279].name      | randomString |
      | data[279].is_active | 1            |
      | data[280].name      | randomString |
      | data[280].is_active | 1            |
      | data[281].name      | randomString |
      | data[281].is_active | 1            |
      | data[282].name      | randomString |
      | data[282].is_active | 1            |
      | data[283].name      | randomString |
      | data[283].is_active | 1            |
      | data[284].name      | randomString |
      | data[284].is_active | 1            |
      | data[285].name      | randomString |
      | data[285].is_active | 1            |
      | data[286].name      | randomString |
      | data[286].is_active | 1            |
      | data[287].name      | randomString |
      | data[287].is_active | 1            |
      | data[288].name      | randomString |
      | data[288].is_active | 1            |
      | data[289].name      | randomString |
      | data[289].is_active | 1            |
      | data[290].name      | randomString |
      | data[290].is_active | 1            |
      | data[291].name      | randomString |
      | data[291].is_active | 1            |
      | data[292].name      | randomString |
      | data[292].is_active | 1            |
      | data[293].name      | randomString |
      | data[293].is_active | 1            |
      | data[294].name      | randomString |
      | data[294].is_active | 1            |
      | data[295].name      | randomString |
      | data[295].is_active | 1            |
      | data[296].name      | randomString |
      | data[296].is_active | 1            |
      | data[297].name      | randomString |
      | data[297].is_active | 1            |
      | data[298].name      | randomString |
      | data[298].is_active | 1            |
      | data[299].name      | randomString |
      | data[299].is_active | 1            |
      | data[300].name      | randomString |
      | data[300].is_active | 1            |
      | data[301].name      | randomString |
      | data[301].is_active | 1            |
      | data[302].name      | randomString |
      | data[302].is_active | 1            |
      | data[303].name      | randomString |
      | data[303].is_active | 1            |
      | data[304].name      | randomString |
      | data[304].is_active | 1            |
      | data[305].name      | randomString |
      | data[305].is_active | 1            |
      | data[306].name      | randomString |
      | data[306].is_active | 1            |
      | data[307].name      | randomString |
      | data[307].is_active | 1            |
      | data[308].name      | randomString |
      | data[308].is_active | 1            |
      | data[309].name      | randomString |
      | data[309].is_active | 1            |
      | data[310].name      | randomString |
      | data[310].is_active | 1            |
      | data[311].name      | randomString |
      | data[311].is_active | 1            |
      | data[312].name      | randomString |
      | data[312].is_active | 1            |
      | data[313].name      | randomString |
      | data[313].is_active | 1            |
      | data[314].name      | randomString |
      | data[314].is_active | 1            |
      | data[315].name      | randomString |
      | data[315].is_active | 1            |
      | data[316].name      | randomString |
      | data[316].is_active | 1            |
      | data[317].name      | randomString |
      | data[317].is_active | 1            |
      | data[318].name      | randomString |
      | data[318].is_active | 1            |
      | data[319].name      | randomString |
      | data[319].is_active | 1            |
      | data[320].name      | randomString |
      | data[320].is_active | 1            |
      | data[321].name      | randomString |
      | data[321].is_active | 1            |
      | data[322].name      | randomString |
      | data[322].is_active | 1            |
      | data[323].name      | randomString |
      | data[323].is_active | 1            |
      | data[324].name      | randomString |
      | data[324].is_active | 1            |
      | data[325].name      | randomString |
      | data[325].is_active | 1            |
      | data[326].name      | randomString |
      | data[326].is_active | 1            |
      | data[327].name      | randomString |
      | data[327].is_active | 1            |
      | data[328].name      | randomString |
      | data[328].is_active | 1            |
      | data[329].name      | randomString |
      | data[329].is_active | 1            |
      | data[330].name      | randomString |
      | data[330].is_active | 1            |
      | data[331].name      | randomString |
      | data[331].is_active | 1            |
      | data[332].name      | randomString |
      | data[332].is_active | 1            |
      | data[333].name      | randomString |
      | data[333].is_active | 1            |
      | data[334].name      | randomString |
      | data[334].is_active | 1            |
      | data[335].name      | randomString |
      | data[335].is_active | 1            |
      | data[336].name      | randomString |
      | data[336].is_active | 1            |
      | data[337].name      | randomString |
      | data[337].is_active | 1            |
      | data[338].name      | randomString |
      | data[338].is_active | 1            |
      | data[339].name      | randomString |
      | data[339].is_active | 1            |
      | data[340].name      | randomString |
      | data[340].is_active | 1            |
      | data[341].name      | randomString |
      | data[341].is_active | 1            |
      | data[342].name      | randomString |
      | data[342].is_active | 1            |
      | data[343].name      | randomString |
      | data[343].is_active | 1            |
      | data[344].name      | randomString |
      | data[344].is_active | 1            |
      | data[345].name      | randomString |
      | data[345].is_active | 1            |
      | data[346].name      | randomString |
      | data[346].is_active | 1            |
      | data[347].name      | randomString |
      | data[347].is_active | 1            |
      | data[348].name      | randomString |
      | data[348].is_active | 1            |
      | data[349].name      | randomString |
      | data[349].is_active | 1            |
      | data[350].name      | randomString |
      | data[350].is_active | 1            |
      | data[351].name      | randomString |
      | data[351].is_active | 1            |
      | data[352].name      | randomString |
      | data[352].is_active | 1            |
      | data[353].name      | randomString |
      | data[353].is_active | 1            |
      | data[354].name      | randomString |
      | data[354].is_active | 1            |
      | data[355].name      | randomString |
      | data[355].is_active | 1            |
      | data[356].name      | randomString |
      | data[356].is_active | 1            |
      | data[357].name      | randomString |
      | data[357].is_active | 1            |
      | data[358].name      | randomString |
      | data[358].is_active | 1            |
      | data[359].name      | randomString |
      | data[359].is_active | 1            |
      | data[360].name      | randomString |
      | data[360].is_active | 1            |
      | data[361].name      | randomString |
      | data[361].is_active | 1            |
      | data[362].name      | randomString |
      | data[362].is_active | 1            |
      | data[363].name      | randomString |
      | data[363].is_active | 1            |
      | data[364].name      | randomString |
      | data[364].is_active | 1            |
      | data[365].name      | randomString |
      | data[365].is_active | 1            |
      | data[366].name      | randomString |
      | data[366].is_active | 1            |
      | data[367].name      | randomString |
      | data[367].is_active | 1            |
      | data[368].name      | randomString |
      | data[368].is_active | 1            |
      | data[369].name      | randomString |
      | data[369].is_active | 1            |
      | data[370].name      | randomString |
      | data[370].is_active | 1            |
      | data[371].name      | randomString |
      | data[371].is_active | 1            |
      | data[372].name      | randomString |
      | data[372].is_active | 1            |
      | data[373].name      | randomString |
      | data[373].is_active | 1            |
      | data[374].name      | randomString |
      | data[374].is_active | 1            |
      | data[375].name      | randomString |
      | data[375].is_active | 1            |
      | data[376].name      | randomString |
      | data[376].is_active | 1            |
      | data[377].name      | randomString |
      | data[377].is_active | 1            |
      | data[378].name      | randomString |
      | data[378].is_active | 1            |
      | data[379].name      | randomString |
      | data[379].is_active | 1            |
      | data[380].name      | randomString |
      | data[380].is_active | 1            |
      | data[381].name      | randomString |
      | data[381].is_active | 1            |
      | data[382].name      | randomString |
      | data[382].is_active | 1            |
      | data[383].name      | randomString |
      | data[383].is_active | 1            |
      | data[384].name      | randomString |
      | data[384].is_active | 1            |
      | data[385].name      | randomString |
      | data[385].is_active | 1            |
      | data[386].name      | randomString |
      | data[386].is_active | 1            |
      | data[387].name      | randomString |
      | data[387].is_active | 1            |
      | data[388].name      | randomString |
      | data[388].is_active | 1            |
      | data[389].name      | randomString |
      | data[389].is_active | 1            |
      | data[390].name      | randomString |
      | data[390].is_active | 1            |
      | data[391].name      | randomString |
      | data[391].is_active | 1            |
      | data[392].name      | randomString |
      | data[392].is_active | 1            |
      | data[393].name      | randomString |
      | data[393].is_active | 1            |
      | data[394].name      | randomString |
      | data[394].is_active | 1            |
      | data[395].name      | randomString |
      | data[395].is_active | 1            |
      | data[396].name      | randomString |
      | data[396].is_active | 1            |
      | data[397].name      | randomString |
      | data[397].is_active | 1            |
      | data[398].name      | randomString |
      | data[398].is_active | 1            |
      | data[399].name      | randomString |
      | data[399].is_active | 1            |
      | data[400].name      | randomString |
      | data[400].is_active | 1            |
      | data[401].name      | randomString |
      | data[401].is_active | 1            |
      | data[402].name      | randomString |
      | data[402].is_active | 1            |
      | data[403].name      | randomString |
      | data[403].is_active | 1            |
      | data[404].name      | randomString |
      | data[404].is_active | 1            |
      | data[405].name      | randomString |
      | data[405].is_active | 1            |
      | data[406].name      | randomString |
      | data[406].is_active | 1            |
      | data[407].name      | randomString |
      | data[407].is_active | 1            |
      | data[408].name      | randomString |
      | data[408].is_active | 1            |
      | data[409].name      | randomString |
      | data[409].is_active | 1            |
      | data[410].name      | randomString |
      | data[410].is_active | 1            |
      | data[411].name      | randomString |
      | data[411].is_active | 1            |
      | data[412].name      | randomString |
      | data[412].is_active | 1            |
      | data[413].name      | randomString |
      | data[413].is_active | 1            |
      | data[414].name      | randomString |
      | data[414].is_active | 1            |
      | data[415].name      | randomString |
      | data[415].is_active | 1            |
      | data[416].name      | randomString |
      | data[416].is_active | 1            |
      | data[417].name      | randomString |
      | data[417].is_active | 1            |
      | data[418].name      | randomString |
      | data[418].is_active | 1            |
      | data[419].name      | randomString |
      | data[419].is_active | 1            |
      | data[420].name      | randomString |
      | data[420].is_active | 1            |
      | data[421].name      | randomString |
      | data[421].is_active | 1            |
      | data[422].name      | randomString |
      | data[422].is_active | 1            |
      | data[423].name      | randomString |
      | data[423].is_active | 1            |
      | data[424].name      | randomString |
      | data[424].is_active | 1            |
      | data[425].name      | randomString |
      | data[425].is_active | 1            |
      | data[426].name      | randomString |
      | data[426].is_active | 1            |
      | data[427].name      | randomString |
      | data[427].is_active | 1            |
      | data[428].name      | randomString |
      | data[428].is_active | 1            |
      | data[429].name      | randomString |
      | data[429].is_active | 1            |
      | data[430].name      | randomString |
      | data[430].is_active | 1            |
      | data[431].name      | randomString |
      | data[431].is_active | 1            |
      | data[432].name      | randomString |
      | data[432].is_active | 1            |
      | data[433].name      | randomString |
      | data[433].is_active | 1            |
      | data[434].name      | randomString |
      | data[434].is_active | 1            |
      | data[435].name      | randomString |
      | data[435].is_active | 1            |
      | data[436].name      | randomString |
      | data[436].is_active | 1            |
      | data[437].name      | randomString |
      | data[437].is_active | 1            |
      | data[438].name      | randomString |
      | data[438].is_active | 1            |
      | data[439].name      | randomString |
      | data[439].is_active | 1            |
      | data[440].name      | randomString |
      | data[440].is_active | 1            |
      | data[441].name      | randomString |
      | data[441].is_active | 1            |
      | data[442].name      | randomString |
      | data[442].is_active | 1            |
      | data[443].name      | randomString |
      | data[443].is_active | 1            |
      | data[444].name      | randomString |
      | data[444].is_active | 1            |
      | data[445].name      | randomString |
      | data[445].is_active | 1            |
      | data[446].name      | randomString |
      | data[446].is_active | 1            |
      | data[447].name      | randomString |
      | data[447].is_active | 1            |
      | data[448].name      | randomString |
      | data[448].is_active | 1            |
      | data[449].name      | randomString |
      | data[449].is_active | 1            |
      | data[450].name      | randomString |
      | data[450].is_active | 1            |
      | data[451].name      | randomString |
      | data[451].is_active | 1            |
      | data[452].name      | randomString |
      | data[452].is_active | 1            |
      | data[453].name      | randomString |
      | data[453].is_active | 1            |
      | data[454].name      | randomString |
      | data[454].is_active | 1            |
      | data[455].name      | randomString |
      | data[455].is_active | 1            |
      | data[456].name      | randomString |
      | data[456].is_active | 1            |
      | data[457].name      | randomString |
      | data[457].is_active | 1            |
      | data[458].name      | randomString |
      | data[458].is_active | 1            |
      | data[459].name      | randomString |
      | data[459].is_active | 1            |
      | data[460].name      | randomString |
      | data[460].is_active | 1            |
      | data[461].name      | randomString |
      | data[461].is_active | 1            |
      | data[462].name      | randomString |
      | data[462].is_active | 1            |
      | data[463].name      | randomString |
      | data[463].is_active | 1            |
      | data[464].name      | randomString |
      | data[464].is_active | 1            |
      | data[465].name      | randomString |
      | data[465].is_active | 1            |
      | data[466].name      | randomString |
      | data[466].is_active | 1            |
      | data[467].name      | randomString |
      | data[467].is_active | 1            |
      | data[468].name      | randomString |
      | data[468].is_active | 1            |
      | data[469].name      | randomString |
      | data[469].is_active | 1            |
      | data[470].name      | randomString |
      | data[470].is_active | 1            |
      | data[471].name      | randomString |
      | data[471].is_active | 1            |
      | data[472].name      | randomString |
      | data[472].is_active | 1            |
      | data[473].name      | randomString |
      | data[473].is_active | 1            |
      | data[474].name      | randomString |
      | data[474].is_active | 1            |
      | data[475].name      | randomString |
      | data[475].is_active | 1            |
      | data[476].name      | randomString |
      | data[476].is_active | 1            |
      | data[477].name      | randomString |
      | data[477].is_active | 1            |
      | data[478].name      | randomString |
      | data[478].is_active | 1            |
      | data[479].name      | randomString |
      | data[479].is_active | 1            |
      | data[480].name      | randomString |
      | data[480].is_active | 1            |
      | data[481].name      | randomString |
      | data[481].is_active | 1            |
      | data[482].name      | randomString |
      | data[482].is_active | 1            |
      | data[483].name      | randomString |
      | data[483].is_active | 1            |
      | data[484].name      | randomString |
      | data[484].is_active | 1            |
      | data[485].name      | randomString |
      | data[485].is_active | 1            |
      | data[486].name      | randomString |
      | data[486].is_active | 1            |
      | data[487].name      | randomString |
      | data[487].is_active | 1            |
      | data[488].name      | randomString |
      | data[488].is_active | 1            |
      | data[489].name      | randomString |
      | data[489].is_active | 1            |
      | data[490].name      | randomString |
      | data[490].is_active | 1            |
      | data[491].name      | randomString |
      | data[491].is_active | 1            |
      | data[492].name      | randomString |
      | data[492].is_active | 1            |
      | data[493].name      | randomString |
      | data[493].is_active | 1            |
      | data[494].name      | randomString |
      | data[494].is_active | 1            |
      | data[495].name      | randomString |
      | data[495].is_active | 1            |
      | data[496].name      | randomString |
      | data[496].is_active | 1            |
      | data[497].name      | randomString |
      | data[497].is_active | 1            |
      | data[498].name      | randomString |
      | data[498].is_active | 1            |
      | data[499].name      | randomString |
      | data[499].is_active | 1            |
      | data[500].name      | randomString |
      | data[500].is_active | 1            |
      | data[501].name      | randomString |
      | data[501].is_active | 1            |
      | data[502].name      | randomString |
      | data[502].is_active | 1            |
      | data[503].name      | randomString |
      | data[503].is_active | 1            |
      | data[504].name      | randomString |
      | data[504].is_active | 1            |
      | data[505].name      | randomString |
      | data[505].is_active | 1            |
      | data[506].name      | randomString |
      | data[506].is_active | 1            |
      | data[507].name      | randomString |
      | data[507].is_active | 1            |
      | data[508].name      | randomString |
      | data[508].is_active | 1            |
      | data[509].name      | randomString |
      | data[509].is_active | 1            |
      | data[510].name      | randomString |
      | data[510].is_active | 1            |
      | data[511].name      | randomString |
      | data[511].is_active | 1            |
      | data[512].name      | randomString |
      | data[512].is_active | 1            |
      | data[513].name      | randomString |
      | data[513].is_active | 1            |
      | data[514].name      | randomString |
      | data[514].is_active | 1            |
      | data[515].name      | randomString |
      | data[515].is_active | 1            |
      | data[516].name      | randomString |
      | data[516].is_active | 1            |
      | data[517].name      | randomString |
      | data[517].is_active | 1            |
      | data[518].name      | randomString |
      | data[518].is_active | 1            |
      | data[519].name      | randomString |
      | data[519].is_active | 1            |
      | data[520].name      | randomString |
      | data[520].is_active | 1            |
      | data[521].name      | randomString |
      | data[521].is_active | 1            |
      | data[522].name      | randomString |
      | data[522].is_active | 1            |
      | data[523].name      | randomString |
      | data[523].is_active | 1            |
      | data[524].name      | randomString |
      | data[524].is_active | 1            |
      | data[525].name      | randomString |
      | data[525].is_active | 1            |
      | data[526].name      | randomString |
      | data[526].is_active | 1            |
      | data[527].name      | randomString |
      | data[527].is_active | 1            |
      | data[528].name      | randomString |
      | data[528].is_active | 1            |
      | data[529].name      | randomString |
      | data[529].is_active | 1            |
      | data[530].name      | randomString |
      | data[530].is_active | 1            |
      | data[531].name      | randomString |
      | data[531].is_active | 1            |
      | data[532].name      | randomString |
      | data[532].is_active | 1            |
      | data[533].name      | randomString |
      | data[533].is_active | 1            |
      | data[534].name      | randomString |
      | data[534].is_active | 1            |
      | data[535].name      | randomString |
      | data[535].is_active | 1            |
      | data[536].name      | randomString |
      | data[536].is_active | 1            |
      | data[537].name      | randomString |
      | data[537].is_active | 1            |
      | data[538].name      | randomString |
      | data[538].is_active | 1            |
      | data[539].name      | randomString |
      | data[539].is_active | 1            |
      | data[540].name      | randomString |
      | data[540].is_active | 1            |
      | data[541].name      | randomString |
      | data[541].is_active | 1            |
      | data[542].name      | randomString |
      | data[542].is_active | 1            |
      | data[543].name      | randomString |
      | data[543].is_active | 1            |
      | data[544].name      | randomString |
      | data[544].is_active | 1            |
      | data[545].name      | randomString |
      | data[545].is_active | 1            |
      | data[546].name      | randomString |
      | data[546].is_active | 1            |
      | data[547].name      | randomString |
      | data[547].is_active | 1            |
      | data[548].name      | randomString |
      | data[548].is_active | 1            |
      | data[549].name      | randomString |
      | data[549].is_active | 1            |
      | data[550].name      | randomString |
      | data[550].is_active | 1            |
      | data[551].name      | randomString |
      | data[551].is_active | 1            |
      | data[552].name      | randomString |
      | data[552].is_active | 1            |
      | data[553].name      | randomString |
      | data[553].is_active | 1            |
      | data[554].name      | randomString |
      | data[554].is_active | 1            |
      | data[555].name      | randomString |
      | data[555].is_active | 1            |
      | data[556].name      | randomString |
      | data[556].is_active | 1            |
      | data[557].name      | randomString |
      | data[557].is_active | 1            |
      | data[558].name      | randomString |
      | data[558].is_active | 1            |
      | data[559].name      | randomString |
      | data[559].is_active | 1            |
      | data[560].name      | randomString |
      | data[560].is_active | 1            |
      | data[561].name      | randomString |
      | data[561].is_active | 1            |
      | data[562].name      | randomString |
      | data[562].is_active | 1            |
      | data[563].name      | randomString |
      | data[563].is_active | 1            |
      | data[564].name      | randomString |
      | data[564].is_active | 1            |
      | data[565].name      | randomString |
      | data[565].is_active | 1            |
      | data[566].name      | randomString |
      | data[566].is_active | 1            |
      | data[567].name      | randomString |
      | data[567].is_active | 1            |
      | data[568].name      | randomString |
      | data[568].is_active | 1            |
      | data[569].name      | randomString |
      | data[569].is_active | 1            |
      | data[570].name      | randomString |
      | data[570].is_active | 1            |
      | data[571].name      | randomString |
      | data[571].is_active | 1            |
      | data[572].name      | randomString |
      | data[572].is_active | 1            |
      | data[573].name      | randomString |
      | data[573].is_active | 1            |
      | data[574].name      | randomString |
      | data[574].is_active | 1            |
      | data[575].name      | randomString |
      | data[575].is_active | 1            |
      | data[576].name      | randomString |
      | data[576].is_active | 1            |
      | data[577].name      | randomString |
      | data[577].is_active | 1            |
      | data[578].name      | randomString |
      | data[578].is_active | 1            |
      | data[579].name      | randomString |
      | data[579].is_active | 1            |
      | data[580].name      | randomString |
      | data[580].is_active | 1            |
      | data[581].name      | randomString |
      | data[581].is_active | 1            |
      | data[582].name      | randomString |
      | data[582].is_active | 1            |
      | data[583].name      | randomString |
      | data[583].is_active | 1            |
      | data[584].name      | randomString |
      | data[584].is_active | 1            |
      | data[585].name      | randomString |
      | data[585].is_active | 1            |
      | data[586].name      | randomString |
      | data[586].is_active | 1            |
      | data[587].name      | randomString |
      | data[587].is_active | 1            |
      | data[588].name      | randomString |
      | data[588].is_active | 1            |
      | data[589].name      | randomString |
      | data[589].is_active | 1            |
      | data[590].name      | randomString |
      | data[590].is_active | 1            |
      | data[591].name      | randomString |
      | data[591].is_active | 1            |
      | data[592].name      | randomString |
      | data[592].is_active | 1            |
      | data[593].name      | randomString |
      | data[593].is_active | 1            |
      | data[594].name      | randomString |
      | data[594].is_active | 1            |
      | data[595].name      | randomString |
      | data[595].is_active | 1            |
      | data[596].name      | randomString |
      | data[596].is_active | 1            |
      | data[597].name      | randomString |
      | data[597].is_active | 1            |
      | data[598].name      | randomString |
      | data[598].is_active | 1            |
      | data[599].name      | randomString |
      | data[599].is_active | 1            |
      | data[600].name      | randomString |
      | data[600].is_active | 1            |
      | data[601].name      | randomString |
      | data[601].is_active | 1            |
      | data[602].name      | randomString |
      | data[602].is_active | 1            |
      | data[603].name      | randomString |
      | data[603].is_active | 1            |
      | data[604].name      | randomString |
      | data[604].is_active | 1            |
      | data[605].name      | randomString |
      | data[605].is_active | 1            |
      | data[606].name      | randomString |
      | data[606].is_active | 1            |
      | data[607].name      | randomString |
      | data[607].is_active | 1            |
      | data[608].name      | randomString |
      | data[608].is_active | 1            |
      | data[609].name      | randomString |
      | data[609].is_active | 1            |
      | data[610].name      | randomString |
      | data[610].is_active | 1            |
      | data[611].name      | randomString |
      | data[611].is_active | 1            |
      | data[612].name      | randomString |
      | data[612].is_active | 1            |
      | data[613].name      | randomString |
      | data[613].is_active | 1            |
      | data[614].name      | randomString |
      | data[614].is_active | 1            |
      | data[615].name      | randomString |
      | data[615].is_active | 1            |
      | data[616].name      | randomString |
      | data[616].is_active | 1            |
      | data[617].name      | randomString |
      | data[617].is_active | 1            |
      | data[618].name      | randomString |
      | data[618].is_active | 1            |
      | data[619].name      | randomString |
      | data[619].is_active | 1            |
      | data[620].name      | randomString |
      | data[620].is_active | 1            |
      | data[621].name      | randomString |
      | data[621].is_active | 1            |
      | data[622].name      | randomString |
      | data[622].is_active | 1            |
      | data[623].name      | randomString |
      | data[623].is_active | 1            |
      | data[624].name      | randomString |
      | data[624].is_active | 1            |
      | data[625].name      | randomString |
      | data[625].is_active | 1            |
      | data[626].name      | randomString |
      | data[626].is_active | 1            |
      | data[627].name      | randomString |
      | data[627].is_active | 1            |
      | data[628].name      | randomString |
      | data[628].is_active | 1            |
      | data[629].name      | randomString |
      | data[629].is_active | 1            |
      | data[630].name      | randomString |
      | data[630].is_active | 1            |
      | data[631].name      | randomString |
      | data[631].is_active | 1            |
      | data[632].name      | randomString |
      | data[632].is_active | 1            |
      | data[633].name      | randomString |
      | data[633].is_active | 1            |
      | data[634].name      | randomString |
      | data[634].is_active | 1            |
      | data[635].name      | randomString |
      | data[635].is_active | 1            |
      | data[636].name      | randomString |
      | data[636].is_active | 1            |
      | data[637].name      | randomString |
      | data[637].is_active | 1            |
      | data[638].name      | randomString |
      | data[638].is_active | 1            |
      | data[639].name      | randomString |
      | data[639].is_active | 1            |
      | data[640].name      | randomString |
      | data[640].is_active | 1            |
      | data[641].name      | randomString |
      | data[641].is_active | 1            |
      | data[642].name      | randomString |
      | data[642].is_active | 1            |
      | data[643].name      | randomString |
      | data[643].is_active | 1            |
      | data[644].name      | randomString |
      | data[644].is_active | 1            |
      | data[645].name      | randomString |
      | data[645].is_active | 1            |
      | data[646].name      | randomString |
      | data[646].is_active | 1            |
      | data[647].name      | randomString |
      | data[647].is_active | 1            |
      | data[648].name      | randomString |
      | data[648].is_active | 1            |
      | data[649].name      | randomString |
      | data[649].is_active | 1            |
      | data[650].name      | randomString |
      | data[650].is_active | 1            |
      | data[651].name      | randomString |
      | data[651].is_active | 1            |
      | data[652].name      | randomString |
      | data[652].is_active | 1            |
      | data[653].name      | randomString |
      | data[653].is_active | 1            |
      | data[654].name      | randomString |
      | data[654].is_active | 1            |
      | data[655].name      | randomString |
      | data[655].is_active | 1            |
      | data[656].name      | randomString |
      | data[656].is_active | 1            |
      | data[657].name      | randomString |
      | data[657].is_active | 1            |
      | data[658].name      | randomString |
      | data[658].is_active | 1            |
      | data[659].name      | randomString |
      | data[659].is_active | 1            |
      | data[660].name      | randomString |
      | data[660].is_active | 1            |
      | data[661].name      | randomString |
      | data[661].is_active | 1            |
      | data[662].name      | randomString |
      | data[662].is_active | 1            |
      | data[663].name      | randomString |
      | data[663].is_active | 1            |
      | data[664].name      | randomString |
      | data[664].is_active | 1            |
      | data[665].name      | randomString |
      | data[665].is_active | 1            |
      | data[666].name      | randomString |
      | data[666].is_active | 1            |
      | data[667].name      | randomString |
      | data[667].is_active | 1            |
      | data[668].name      | randomString |
      | data[668].is_active | 1            |
      | data[669].name      | randomString |
      | data[669].is_active | 1            |
      | data[670].name      | randomString |
      | data[670].is_active | 1            |
      | data[671].name      | randomString |
      | data[671].is_active | 1            |
      | data[672].name      | randomString |
      | data[672].is_active | 1            |
      | data[673].name      | randomString |
      | data[673].is_active | 1            |
      | data[674].name      | randomString |
      | data[674].is_active | 1            |
      | data[675].name      | randomString |
      | data[675].is_active | 1            |
      | data[676].name      | randomString |
      | data[676].is_active | 1            |
      | data[677].name      | randomString |
      | data[677].is_active | 1            |
      | data[678].name      | randomString |
      | data[678].is_active | 1            |
      | data[679].name      | randomString |
      | data[679].is_active | 1            |
      | data[680].name      | randomString |
      | data[680].is_active | 1            |
      | data[681].name      | randomString |
      | data[681].is_active | 1            |
      | data[682].name      | randomString |
      | data[682].is_active | 1            |
      | data[683].name      | randomString |
      | data[683].is_active | 1            |
      | data[684].name      | randomString |
      | data[684].is_active | 1            |
      | data[685].name      | randomString |
      | data[685].is_active | 1            |
      | data[686].name      | randomString |
      | data[686].is_active | 1            |
      | data[687].name      | randomString |
      | data[687].is_active | 1            |
      | data[688].name      | randomString |
      | data[688].is_active | 1            |
      | data[689].name      | randomString |
      | data[689].is_active | 1            |
      | data[690].name      | randomString |
      | data[690].is_active | 1            |
      | data[691].name      | randomString |
      | data[691].is_active | 1            |
      | data[692].name      | randomString |
      | data[692].is_active | 1            |
      | data[693].name      | randomString |
      | data[693].is_active | 1            |
      | data[694].name      | randomString |
      | data[694].is_active | 1            |
      | data[695].name      | randomString |
      | data[695].is_active | 1            |
      | data[696].name      | randomString |
      | data[696].is_active | 1            |
      | data[697].name      | randomString |
      | data[697].is_active | 1            |
      | data[698].name      | randomString |
      | data[698].is_active | 1            |
      | data[699].name      | randomString |
      | data[699].is_active | 1            |
      | data[700].name      | randomString |
      | data[700].is_active | 1            |
      | data[701].name      | randomString |
      | data[701].is_active | 1            |
      | data[702].name      | randomString |
      | data[702].is_active | 1            |
      | data[703].name      | randomString |
      | data[703].is_active | 1            |
      | data[704].name      | randomString |
      | data[704].is_active | 1            |
      | data[705].name      | randomString |
      | data[705].is_active | 1            |
      | data[706].name      | randomString |
      | data[706].is_active | 1            |
      | data[707].name      | randomString |
      | data[707].is_active | 1            |
      | data[708].name      | randomString |
      | data[708].is_active | 1            |
      | data[709].name      | randomString |
      | data[709].is_active | 1            |
      | data[710].name      | randomString |
      | data[710].is_active | 1            |
      | data[711].name      | randomString |
      | data[711].is_active | 1            |
      | data[712].name      | randomString |
      | data[712].is_active | 1            |
      | data[713].name      | randomString |
      | data[713].is_active | 1            |
      | data[714].name      | randomString |
      | data[714].is_active | 1            |
      | data[715].name      | randomString |
      | data[715].is_active | 1            |
      | data[716].name      | randomString |
      | data[716].is_active | 1            |
      | data[717].name      | randomString |
      | data[717].is_active | 1            |
      | data[718].name      | randomString |
      | data[718].is_active | 1            |
      | data[719].name      | randomString |
      | data[719].is_active | 1            |
      | data[720].name      | randomString |
      | data[720].is_active | 1            |
      | data[721].name      | randomString |
      | data[721].is_active | 1            |
      | data[722].name      | randomString |
      | data[722].is_active | 1            |
      | data[723].name      | randomString |
      | data[723].is_active | 1            |
      | data[724].name      | randomString |
      | data[724].is_active | 1            |
      | data[725].name      | randomString |
      | data[725].is_active | 1            |
      | data[726].name      | randomString |
      | data[726].is_active | 1            |
      | data[727].name      | randomString |
      | data[727].is_active | 1            |
      | data[728].name      | randomString |
      | data[728].is_active | 1            |
      | data[729].name      | randomString |
      | data[729].is_active | 1            |
      | data[730].name      | randomString |
      | data[730].is_active | 1            |
      | data[731].name      | randomString |
      | data[731].is_active | 1            |
      | data[732].name      | randomString |
      | data[732].is_active | 1            |
      | data[733].name      | randomString |
      | data[733].is_active | 1            |
      | data[734].name      | randomString |
      | data[734].is_active | 1            |
      | data[735].name      | randomString |
      | data[735].is_active | 1            |
      | data[736].name      | randomString |
      | data[736].is_active | 1            |
      | data[737].name      | randomString |
      | data[737].is_active | 1            |
      | data[738].name      | randomString |
      | data[738].is_active | 1            |
      | data[739].name      | randomString |
      | data[739].is_active | 1            |
      | data[740].name      | randomString |
      | data[740].is_active | 1            |
      | data[741].name      | randomString |
      | data[741].is_active | 1            |
      | data[742].name      | randomString |
      | data[742].is_active | 1            |
      | data[743].name      | randomString |
      | data[743].is_active | 1            |
      | data[744].name      | randomString |
      | data[744].is_active | 1            |
      | data[745].name      | randomString |
      | data[745].is_active | 1            |
      | data[746].name      | randomString |
      | data[746].is_active | 1            |
      | data[747].name      | randomString |
      | data[747].is_active | 1            |
      | data[748].name      | randomString |
      | data[748].is_active | 1            |
      | data[749].name      | randomString |
      | data[749].is_active | 1            |
      | data[750].name      | randomString |
      | data[750].is_active | 1            |
      | data[751].name      | randomString |
      | data[751].is_active | 1            |
      | data[752].name      | randomString |
      | data[752].is_active | 1            |
      | data[753].name      | randomString |
      | data[753].is_active | 1            |
      | data[754].name      | randomString |
      | data[754].is_active | 1            |
      | data[755].name      | randomString |
      | data[755].is_active | 1            |
      | data[756].name      | randomString |
      | data[756].is_active | 1            |
      | data[757].name      | randomString |
      | data[757].is_active | 1            |
      | data[758].name      | randomString |
      | data[758].is_active | 1            |
      | data[759].name      | randomString |
      | data[759].is_active | 1            |
      | data[760].name      | randomString |
      | data[760].is_active | 1            |
      | data[761].name      | randomString |
      | data[761].is_active | 1            |
      | data[762].name      | randomString |
      | data[762].is_active | 1            |
      | data[763].name      | randomString |
      | data[763].is_active | 1            |
      | data[764].name      | randomString |
      | data[764].is_active | 1            |
      | data[765].name      | randomString |
      | data[765].is_active | 1            |
      | data[766].name      | randomString |
      | data[766].is_active | 1            |
      | data[767].name      | randomString |
      | data[767].is_active | 1            |
      | data[768].name      | randomString |
      | data[768].is_active | 1            |
      | data[769].name      | randomString |
      | data[769].is_active | 1            |
      | data[770].name      | randomString |
      | data[770].is_active | 1            |
      | data[771].name      | randomString |
      | data[771].is_active | 1            |
      | data[772].name      | randomString |
      | data[772].is_active | 1            |
      | data[773].name      | randomString |
      | data[773].is_active | 1            |
      | data[774].name      | randomString |
      | data[774].is_active | 1            |
      | data[775].name      | randomString |
      | data[775].is_active | 1            |
      | data[776].name      | randomString |
      | data[776].is_active | 1            |
      | data[777].name      | randomString |
      | data[777].is_active | 1            |
      | data[778].name      | randomString |
      | data[778].is_active | 1            |
      | data[779].name      | randomString |
      | data[779].is_active | 1            |
      | data[780].name      | randomString |
      | data[780].is_active | 1            |
      | data[781].name      | randomString |
      | data[781].is_active | 1            |
      | data[782].name      | randomString |
      | data[782].is_active | 1            |
      | data[783].name      | randomString |
      | data[783].is_active | 1            |
      | data[784].name      | randomString |
      | data[784].is_active | 1            |
      | data[785].name      | randomString |
      | data[785].is_active | 1            |
      | data[786].name      | randomString |
      | data[786].is_active | 1            |
      | data[787].name      | randomString |
      | data[787].is_active | 1            |
      | data[788].name      | randomString |
      | data[788].is_active | 1            |
      | data[789].name      | randomString |
      | data[789].is_active | 1            |
      | data[790].name      | randomString |
      | data[790].is_active | 1            |
      | data[791].name      | randomString |
      | data[791].is_active | 1            |
      | data[792].name      | randomString |
      | data[792].is_active | 1            |
      | data[793].name      | randomString |
      | data[793].is_active | 1            |
      | data[794].name      | randomString |
      | data[794].is_active | 1            |
      | data[795].name      | randomString |
      | data[795].is_active | 1            |
      | data[796].name      | randomString |
      | data[796].is_active | 1            |
      | data[797].name      | randomString |
      | data[797].is_active | 1            |
      | data[798].name      | randomString |
      | data[798].is_active | 1            |
      | data[799].name      | randomString |
      | data[799].is_active | 1            |
      | data[800].name      | randomString |
      | data[800].is_active | 1            |
      | data[801].name      | randomString |
      | data[801].is_active | 1            |
      | data[802].name      | randomString |
      | data[802].is_active | 1            |
      | data[803].name      | randomString |
      | data[803].is_active | 1            |
      | data[804].name      | randomString |
      | data[804].is_active | 1            |
      | data[805].name      | randomString |
      | data[805].is_active | 1            |
      | data[806].name      | randomString |
      | data[806].is_active | 1            |
      | data[807].name      | randomString |
      | data[807].is_active | 1            |
      | data[808].name      | randomString |
      | data[808].is_active | 1            |
      | data[809].name      | randomString |
      | data[809].is_active | 1            |
      | data[810].name      | randomString |
      | data[810].is_active | 1            |
      | data[811].name      | randomString |
      | data[811].is_active | 1            |
      | data[812].name      | randomString |
      | data[812].is_active | 1            |
      | data[813].name      | randomString |
      | data[813].is_active | 1            |
      | data[814].name      | randomString |
      | data[814].is_active | 1            |
      | data[815].name      | randomString |
      | data[815].is_active | 1            |
      | data[816].name      | randomString |
      | data[816].is_active | 1            |
      | data[817].name      | randomString |
      | data[817].is_active | 1            |
      | data[818].name      | randomString |
      | data[818].is_active | 1            |
      | data[819].name      | randomString |
      | data[819].is_active | 1            |
      | data[820].name      | randomString |
      | data[820].is_active | 1            |
      | data[821].name      | randomString |
      | data[821].is_active | 1            |
      | data[822].name      | randomString |
      | data[822].is_active | 1            |
      | data[823].name      | randomString |
      | data[823].is_active | 1            |
      | data[824].name      | randomString |
      | data[824].is_active | 1            |
      | data[825].name      | randomString |
      | data[825].is_active | 1            |
      | data[826].name      | randomString |
      | data[826].is_active | 1            |
      | data[827].name      | randomString |
      | data[827].is_active | 1            |
      | data[828].name      | randomString |
      | data[828].is_active | 1            |
      | data[829].name      | randomString |
      | data[829].is_active | 1            |
      | data[830].name      | randomString |
      | data[830].is_active | 1            |
      | data[831].name      | randomString |
      | data[831].is_active | 1            |
      | data[832].name      | randomString |
      | data[832].is_active | 1            |
      | data[833].name      | randomString |
      | data[833].is_active | 1            |
      | data[834].name      | randomString |
      | data[834].is_active | 1            |
      | data[835].name      | randomString |
      | data[835].is_active | 1            |
      | data[836].name      | randomString |
      | data[836].is_active | 1            |
      | data[837].name      | randomString |
      | data[837].is_active | 1            |
      | data[838].name      | randomString |
      | data[838].is_active | 1            |
      | data[839].name      | randomString |
      | data[839].is_active | 1            |
      | data[840].name      | randomString |
      | data[840].is_active | 1            |
      | data[841].name      | randomString |
      | data[841].is_active | 1            |
      | data[842].name      | randomString |
      | data[842].is_active | 1            |
      | data[843].name      | randomString |
      | data[843].is_active | 1            |
      | data[844].name      | randomString |
      | data[844].is_active | 1            |
      | data[845].name      | randomString |
      | data[845].is_active | 1            |
      | data[846].name      | randomString |
      | data[846].is_active | 1            |
      | data[847].name      | randomString |
      | data[847].is_active | 1            |
      | data[848].name      | randomString |
      | data[848].is_active | 1            |
      | data[849].name      | randomString |
      | data[849].is_active | 1            |
      | data[850].name      | randomString |
      | data[850].is_active | 1            |
      | data[851].name      | randomString |
      | data[851].is_active | 1            |
      | data[852].name      | randomString |
      | data[852].is_active | 1            |
      | data[853].name      | randomString |
      | data[853].is_active | 1            |
      | data[854].name      | randomString |
      | data[854].is_active | 1            |
      | data[855].name      | randomString |
      | data[855].is_active | 1            |
      | data[856].name      | randomString |
      | data[856].is_active | 1            |
      | data[857].name      | randomString |
      | data[857].is_active | 1            |
      | data[858].name      | randomString |
      | data[858].is_active | 1            |
      | data[859].name      | randomString |
      | data[859].is_active | 1            |
      | data[860].name      | randomString |
      | data[860].is_active | 1            |
      | data[861].name      | randomString |
      | data[861].is_active | 1            |
      | data[862].name      | randomString |
      | data[862].is_active | 1            |
      | data[863].name      | randomString |
      | data[863].is_active | 1            |
      | data[864].name      | randomString |
      | data[864].is_active | 1            |
      | data[865].name      | randomString |
      | data[865].is_active | 1            |
      | data[866].name      | randomString |
      | data[866].is_active | 1            |
      | data[867].name      | randomString |
      | data[867].is_active | 1            |
      | data[868].name      | randomString |
      | data[868].is_active | 1            |
      | data[869].name      | randomString |
      | data[869].is_active | 1            |
      | data[870].name      | randomString |
      | data[870].is_active | 1            |
      | data[871].name      | randomString |
      | data[871].is_active | 1            |
      | data[872].name      | randomString |
      | data[872].is_active | 1            |
      | data[873].name      | randomString |
      | data[873].is_active | 1            |
      | data[874].name      | randomString |
      | data[874].is_active | 1            |
      | data[875].name      | randomString |
      | data[875].is_active | 1            |
      | data[876].name      | randomString |
      | data[876].is_active | 1            |
      | data[877].name      | randomString |
      | data[877].is_active | 1            |
      | data[878].name      | randomString |
      | data[878].is_active | 1            |
      | data[879].name      | randomString |
      | data[879].is_active | 1            |
      | data[880].name      | randomString |
      | data[880].is_active | 1            |
      | data[881].name      | randomString |
      | data[881].is_active | 1            |
      | data[882].name      | randomString |
      | data[882].is_active | 1            |
      | data[883].name      | randomString |
      | data[883].is_active | 1            |
      | data[884].name      | randomString |
      | data[884].is_active | 1            |
      | data[885].name      | randomString |
      | data[885].is_active | 1            |
      | data[886].name      | randomString |
      | data[886].is_active | 1            |
      | data[887].name      | randomString |
      | data[887].is_active | 1            |
      | data[888].name      | randomString |
      | data[888].is_active | 1            |
      | data[889].name      | randomString |
      | data[889].is_active | 1            |
      | data[890].name      | randomString |
      | data[890].is_active | 1            |
      | data[891].name      | randomString |
      | data[891].is_active | 1            |
      | data[892].name      | randomString |
      | data[892].is_active | 1            |
      | data[893].name      | randomString |
      | data[893].is_active | 1            |
      | data[894].name      | randomString |
      | data[894].is_active | 1            |
      | data[895].name      | randomString |
      | data[895].is_active | 1            |
      | data[896].name      | randomString |
      | data[896].is_active | 1            |
      | data[897].name      | randomString |
      | data[897].is_active | 1            |
      | data[898].name      | randomString |
      | data[898].is_active | 1            |
      | data[899].name      | randomString |
      | data[899].is_active | 1            |
      | data[900].name      | randomString |
      | data[900].is_active | 1            |
      | data[901].name      | randomString |
      | data[901].is_active | 1            |
      | data[902].name      | randomString |
      | data[902].is_active | 1            |
      | data[903].name      | randomString |
      | data[903].is_active | 1            |
      | data[904].name      | randomString |
      | data[904].is_active | 1            |
      | data[905].name      | randomString |
      | data[905].is_active | 1            |
      | data[906].name      | randomString |
      | data[906].is_active | 1            |
      | data[907].name      | randomString |
      | data[907].is_active | 1            |
      | data[908].name      | randomString |
      | data[908].is_active | 1            |
      | data[909].name      | randomString |
      | data[909].is_active | 1            |
      | data[910].name      | randomString |
      | data[910].is_active | 1            |
      | data[911].name      | randomString |
      | data[911].is_active | 1            |
      | data[912].name      | randomString |
      | data[912].is_active | 1            |
      | data[913].name      | randomString |
      | data[913].is_active | 1            |
      | data[914].name      | randomString |
      | data[914].is_active | 1            |
      | data[915].name      | randomString |
      | data[915].is_active | 1            |
      | data[916].name      | randomString |
      | data[916].is_active | 1            |
      | data[917].name      | randomString |
      | data[917].is_active | 1            |
      | data[918].name      | randomString |
      | data[918].is_active | 1            |
      | data[919].name      | randomString |
      | data[919].is_active | 1            |
      | data[920].name      | randomString |
      | data[920].is_active | 1            |
      | data[921].name      | randomString |
      | data[921].is_active | 1            |
      | data[922].name      | randomString |
      | data[922].is_active | 1            |
      | data[923].name      | randomString |
      | data[923].is_active | 1            |
      | data[924].name      | randomString |
      | data[924].is_active | 1            |
      | data[925].name      | randomString |
      | data[925].is_active | 1            |
      | data[926].name      | randomString |
      | data[926].is_active | 1            |
      | data[927].name      | randomString |
      | data[927].is_active | 1            |
      | data[928].name      | randomString |
      | data[928].is_active | 1            |
      | data[929].name      | randomString |
      | data[929].is_active | 1            |
      | data[930].name      | randomString |
      | data[930].is_active | 1            |
      | data[931].name      | randomString |
      | data[931].is_active | 1            |
      | data[932].name      | randomString |
      | data[932].is_active | 1            |
      | data[933].name      | randomString |
      | data[933].is_active | 1            |
      | data[934].name      | randomString |
      | data[934].is_active | 1            |
      | data[935].name      | randomString |
      | data[935].is_active | 1            |
      | data[936].name      | randomString |
      | data[936].is_active | 1            |
      | data[937].name      | randomString |
      | data[937].is_active | 1            |
      | data[938].name      | randomString |
      | data[938].is_active | 1            |
      | data[939].name      | randomString |
      | data[939].is_active | 1            |
      | data[940].name      | randomString |
      | data[940].is_active | 1            |
      | data[941].name      | randomString |
      | data[941].is_active | 1            |
      | data[942].name      | randomString |
      | data[942].is_active | 1            |
      | data[943].name      | randomString |
      | data[943].is_active | 1            |
      | data[944].name      | randomString |
      | data[944].is_active | 1            |
      | data[945].name      | randomString |
      | data[945].is_active | 1            |
      | data[946].name      | randomString |
      | data[946].is_active | 1            |
      | data[947].name      | randomString |
      | data[947].is_active | 1            |
      | data[948].name      | randomString |
      | data[948].is_active | 1            |
      | data[949].name      | randomString |
      | data[949].is_active | 1            |
      | data[950].name      | randomString |
      | data[950].is_active | 1            |
      | data[951].name      | randomString |
      | data[951].is_active | 1            |
      | data[952].name      | randomString |
      | data[952].is_active | 1            |
      | data[953].name      | randomString |
      | data[953].is_active | 1            |
      | data[954].name      | randomString |
      | data[954].is_active | 1            |
      | data[955].name      | randomString |
      | data[955].is_active | 1            |
      | data[956].name      | randomString |
      | data[956].is_active | 1            |
      | data[957].name      | randomString |
      | data[957].is_active | 1            |
      | data[958].name      | randomString |
      | data[958].is_active | 1            |
      | data[959].name      | randomString |
      | data[959].is_active | 1            |
      | data[960].name      | randomString |
      | data[960].is_active | 1            |
      | data[961].name      | randomString |
      | data[961].is_active | 1            |
      | data[962].name      | randomString |
      | data[962].is_active | 1            |
      | data[963].name      | randomString |
      | data[963].is_active | 1            |
      | data[964].name      | randomString |
      | data[964].is_active | 1            |
      | data[965].name      | randomString |
      | data[965].is_active | 1            |
      | data[966].name      | randomString |
      | data[966].is_active | 1            |
      | data[967].name      | randomString |
      | data[967].is_active | 1            |
      | data[968].name      | randomString |
      | data[968].is_active | 1            |
      | data[969].name      | randomString |
      | data[969].is_active | 1            |
      | data[970].name      | randomString |
      | data[970].is_active | 1            |
      | data[971].name      | randomString |
      | data[971].is_active | 1            |
      | data[972].name      | randomString |
      | data[972].is_active | 1            |
      | data[973].name      | randomString |
      | data[973].is_active | 1            |
      | data[974].name      | randomString |
      | data[974].is_active | 1            |
      | data[975].name      | randomString |
      | data[975].is_active | 1            |
      | data[976].name      | randomString |
      | data[976].is_active | 1            |
      | data[977].name      | randomString |
      | data[977].is_active | 1            |
      | data[978].name      | randomString |
      | data[978].is_active | 1            |
      | data[979].name      | randomString |
      | data[979].is_active | 1            |
      | data[980].name      | randomString |
      | data[980].is_active | 1            |
      | data[981].name      | randomString |
      | data[981].is_active | 1            |
      | data[982].name      | randomString |
      | data[982].is_active | 1            |
      | data[983].name      | randomString |
      | data[983].is_active | 1            |
      | data[984].name      | randomString |
      | data[984].is_active | 1            |
      | data[985].name      | randomString |
      | data[985].is_active | 1            |
      | data[986].name      | randomString |
      | data[986].is_active | 1            |
      | data[987].name      | randomString |
      | data[987].is_active | 1            |
      | data[988].name      | randomString |
      | data[988].is_active | 1            |
      | data[989].name      | randomString |
      | data[989].is_active | 1            |
      | data[990].name      | randomString |
      | data[990].is_active | 1            |
      | data[991].name      | randomString |
      | data[991].is_active | 1            |
      | data[992].name      | randomString |
      | data[992].is_active | 1            |
      | data[993].name      | randomString |
      | data[993].is_active | 1            |
      | data[994].name      | randomString |
      | data[994].is_active | 1            |
      | data[995].name      | randomString |
      | data[995].is_active | 1            |
      | data[996].name      | randomString |
      | data[996].is_active | 1            |
      | data[997].name      | randomString |
      | data[997].is_active | 1            |
      | data[998].name      | randomString |
      | data[998].is_active | 1            |
      | data[999].name      | randomString |
      | data[999].is_active | 1            |
    When I post the request with "insertBulkMdmData_categories_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
    And verify response time is less than "10000" milliseconds






