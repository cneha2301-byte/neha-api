@UpdateAssetSerialNoMDM @MDM @Execution

Feature: All testcases of UpdateAssetSerialNoMDM


        @UpdateAssetSeriaTest1
        Scenario: UpdateAssetSerialNoMDM - UpdateAssetSeriaTest1 - Mandatory fields - both serialno and assetdetail_id provided (positive)
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_updateAssetSerialno_MDM" payload
                  | JPath                  | Value                                                  |
                  | data[0].assetdetail_id | DB:assetdetails:id:is_active=1 ORDER BY RAND() LIMIT 1 |
                  | data[0].serialno       | randomString                                           |
                  | data[0].serialno       | randomString                                           |
                  | data[1].assetdetail_id | DB:assetdetails:id:is_active=1 ORDER BY RAND() LIMIT 1 |
             When I post the request with "insertMdmData_updateAssetSerialno_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath    | Value                      |
                  | Result   | true                       |
                  | Reason.1 | Data Uploaded Successfully |
                  | Reason.2 | Data Uploaded Successfully |
              And verify response time is less than "3000" milliseconds

        @UpdateAssetSeriaTest2
        Scenario: UpdateAssetSerialNoMDM - UpdateAssetSeriaTest2 - Not passing  Mandatory fields - only serialno  provided
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_updateAssetSerialno_MDM" payload
                  | JPath            | Value        |
                  | data[0].serialno | randomString |
                  | data[1].serialno | randomString |
             When I post the request with "insertMdmData_updateAssetSerialno_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath              | Value          |
                  | Result             | false          |
                  | Reason.1[0].Column | assetdetail_id |
                  | Reason.2[0].Column | assetdetail_id |
              And verify response time is less than "3000" milliseconds

        @UpdateAssetSeriaTest3 @UpdateAssetSerialBugFix
        Scenario: UpdateAssetSerialNoMDM - UpdateAssetSeriaTest3 - Not passing  Mandatory fields - only assetdetail_id provided
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_updateAssetSerialno_MDM" payload
                  | JPath                  | Value                                                  |
                  | data[0].assetdetail_id | DB:assetdetails:id:is_active=1 ORDER BY RAND() LIMIT 1 |
                  | data[1].assetdetail_id | DB:assetdetails:id:is_active=1 ORDER BY RAND() LIMIT 1 |
             When I post the request with "insertMdmData_updateAssetSerialno_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath              | Value    |
                  | Result             | false    |
                  | Reason.1[0].Column | serialno |
                  | Reason.2[0].Column | serialno |
              And verify response time is less than "3000" milliseconds

        @UpdateAssetSeriaTest4
        Scenario: UpdateAssetSerialNoMDM - UpdateAssetSeriaTest4 - Data verification by passing the valid values in mandatory fields
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_updateAssetSerialno_MDM" payload
                  | JPath                  | Value                           |
                  | data[0].assetdetail_id | DB:assetdetails:id:is_active=1  |
                  | data[0].serialno       | alphaspecial123!@#              |
                  | data[1].serialno       | alphaspecial123!@#              |
                  | data[1].assetdetail_id | DB:assetdetails:id: is_active=1 |
             When I post the request with "insertMdmData_updateAssetSerialno_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath    | Value                      |
                  | Result   | true                       |
                  | Reason.1 | Data Uploaded Successfully |
                  | Reason.2 | Data Uploaded Successfully |
              And I verify the data got updated as needed from DB
                  | expectedColumn                       | expectedValue      |
                  | DB:assetdetails:serialno:is_active=1 | alphaspecial123!@# |
              And verify response time is less than "3000" milliseconds

        @UpdateAssetSeriaTest5
        Scenario: UpdateAssetSerialNoMDM - UpdateAssetSeriaTest5 - Valid and active assetdetail id
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_updateAssetSerialno_MDM" payload
                  | JPath                  | Value                           |
                  | data[0].assetdetail_id | DB:assetdetails:id:is_active=1  |
                  | data[0].serialno       | randomString                    |
                  | data[1].serialno       | randomString                    |
                  | data[1].assetdetail_id | DB:assetdetails:id: is_active=1 |
             When I post the request with "insertMdmData_updateAssetSerialno_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath    | Value                      |
                  | Result   | true                       |
                  | Reason.1 | Data Uploaded Successfully |
                  | Reason.2 | Data Uploaded Successfully |
              And verify response time is less than "3000" milliseconds
              
        @UpdateAssetSeriaTest6
        Scenario: UpdateAssetSerialNoMDM - UpdateAssetSeriaTest6 - In active assetdetail id
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_updateAssetSerialno_MDM" payload
                  | JPath                  | Value                           |
                  | data[0].assetdetail_id | DB:assetdetails:id:is_active=0  |
                  | data[0].serialno       | randomString                    |
                  | data[1].serialno       | randomString                    |
                  | data[1].assetdetail_id | DB:assetdetails:id: is_active=0 |
             When I post the request with "insertMdmData_updateAssetSerialno_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath              | Value                                                               |
                  | Result             | false                                                               |
                  | Reason.1[0].Column | assetdetail_id                                                      |
                  | Reason.1[0].Error  | The assetdetail_id mentioned does not exists or inactive in system. |
                  | Reason.2[0].Column | assetdetail_id                                                      |
                  | Reason.2[0].Error  | The assetdetail_id mentioned does not exists or inactive in system. |
              And verify response time is less than "3000" milliseconds

        @UpdateAssetSeriaTest7
        Scenario: UpdateAssetSerialNoMDM - UpdateAssetSeriaTest7 - In valid assetdetail id
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_updateAssetSerialno_MDM" payload
                  | JPath                  | Value              |
                  | data[0].assetdetail_id | randomString       |
                  | data[0].serialno       | randomString       |
                  | data[1].serialno       | randomString       |
                  | data[1].assetdetail_id | randomAlphaNumeric |
             When I post the request with "insertMdmData_updateAssetSerialno_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath              | Value          |
                  | Result             | false          |
                  | Reason.1[0].Column | assetdetail_id |
                  | Reason.2[0].Column | assetdetail_id |
              And verify response time is less than "3000" milliseconds

        @UpdateAssetSeriaTest8
        Scenario: UpdateAssetSerialNoMDM - UpdateAssetSeriaTest8 - In valid assetdetail id
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_updateAssetSerialno_MDM" payload
                  | JPath                  | Value        |
                  | data[0].assetdetail_id | randomInt    |
                  | data[0].serialno       | randomString |
                  | data[1].serialno       | randomString |
                  | data[1].assetdetail_id | randomDouble |
             When I post the request with "insertMdmData_updateAssetSerialno_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath              | Value          |
                  | Result             | false          |
                  | Reason.1[0].Column | assetdetail_id |
                  | Reason.2[0].Column | assetdetail_id |
              And verify response time is less than "3000" milliseconds
        @UpdateAssetSeriaTest9
        Scenario: UpdateAssetSerialNoMDM - UpdateAssetSeriaTest8 - In valid assetdetail id
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_updateAssetSerialno_MDM" payload
                  | JPath                  | Value        |
                  | data[0].assetdetail_id | 0            |
                  | data[0].serialno       | randomString |
                  | data[1].serialno       | randomString |
                  | data[1].assetdetail_id | -9           |
             When I post the request with "insertMdmData_updateAssetSerialno_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath              | Value          |
                  | Result             | false          |
                  | Reason.1[0].Column | assetdetail_id |
                  | Reason.2[0].Column | assetdetail_id |
              And verify response time is less than "3000" milliseconds
        @UpdateAssetSeriaTest10
        Scenario: UpdateAssetSerialNoMDM - UpdateAssetSeriaTest8 - In valid assetdetail id
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_updateAssetSerialno_MDM" payload
                  | JPath                  | Value                 |
                  | data[0].assetdetail_id | randomAsciiCharacters |
                  | data[0].serialno       | randomString          |
                  | data[1].serialno       | randomString          |
                  | data[1].assetdetail_id | 11.11                 |
             When I post the request with "insertMdmData_updateAssetSerialno_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath              | Value          |
                  | Result             | false          |
                  | Reason.1[0].Column | assetdetail_id |
                  | Reason.2[0].Column | assetdetail_id |
              And verify response time is less than "3000" milliseconds

        @UpdateAssetSeriaTest11
        Scenario: UpdateAssetSerialNoMDM - UpdateAssetSeriaTest11 - Valid serialno
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_updateAssetSerialno_MDM" payload
                  | JPath                  | Value                           |
                  | data[0].assetdetail_id | DB:assetdetails:id:is_active=1  |
                  | data[0].serialno       | randomString                    |
                  | data[1].serialno       | randomString                    |
                  | data[1].assetdetail_id | DB:assetdetails:id: is_active=1 |
             When I post the request with "insertMdmData_updateAssetSerialno_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath    | Value                      |
                  | Result   | true                       |
                  | Reason.1 | Data Uploaded Successfully |
                  | Reason.2 | Data Uploaded Successfully |
              And verify response time is less than "3000" milliseconds
              
        @UpdateAssetSeriaTest12
        Scenario: UpdateAssetSerialNoMDM - UpdateAssetSeriaTest12 - Valid serialno
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_updateAssetSerialno_MDM" payload
                  | JPath                  | Value                           |
                  | data[0].assetdetail_id | DB:assetdetails:id:is_active=1  |
                  | data[0].serialno       | randomAlphaNumeric              |
                  | data[1].serialno       | randomAsciiCharacters           |
                  | data[1].assetdetail_id | DB:assetdetails:id: is_active=1 |
             When I post the request with "insertMdmData_updateAssetSerialno_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath    | Value                      |
                  | Result   | true                       |
                  | Reason.1 | Data Uploaded Successfully |
                  | Reason.2 | Data Uploaded Successfully |
              And verify response time is less than "3000" milliseconds
              
        @UpdateAssetSeriaTest13
        Scenario: UpdateAssetSerialNoMDM - UpdateAssetSeriaTest13 - Valid serialno
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_updateAssetSerialno_MDM" payload
                  | JPath                  | Value                           |
                  | data[0].assetdetail_id | DB:assetdetails:id:is_active=1  |
                  | data[0].serialno       | randomInt                       |
                  | data[1].serialno       | randomDouble                    |
                  | data[1].assetdetail_id | DB:assetdetails:id: is_active=1 |
             When I post the request with "insertMdmData_updateAssetSerialno_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath    | Value                      |
                  | Result   | true                       |
                  | Reason.1 | Data Uploaded Successfully |
                  | Reason.2 | Data Uploaded Successfully |
              And verify response time is less than "3000" milliseconds
        @UpdateAssetSeriaTest14
        Scenario: UpdateAssetSerialNoMDM - UpdateAssetSeriaTest14 - Valid serialno - Valid boundary vakue-100 characters
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_updateAssetSerialno_MDM" payload
                  | JPath                  | Value                           |
                  | data[0].assetdetail_id | DB:assetdetails:id:is_active=1  |
                  | data[0].serialno       | randomString:100                |
                  | data[1].serialno       | randomString:100                |
                  | data[1].assetdetail_id | DB:assetdetails:id: is_active=1 |
             When I post the request with "insertMdmData_updateAssetSerialno_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath    | Value                      |
                  | Result   | true                       |
                  | Reason.1 | Data Uploaded Successfully |
                  | Reason.2 | Data Uploaded Successfully |
              And verify response time is less than "3000" milliseconds
        @UpdateAssetSeriaTest15
        Scenario: UpdateAssetSerialNoMDM - UpdateAssetSeriaTest15 - Valid serialno - Invalid boundary vakue>100 characters
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_updateAssetSerialno_MDM" payload
                  | JPath                  | Value                           |
                  | data[0].assetdetail_id | DB:assetdetails:id:is_active=1  |
                  | data[0].serialno       | randomString:101                |
                  | data[1].serialno       | randomString:101                |
                  | data[1].assetdetail_id | DB:assetdetails:id: is_active=1 |
             When I post the request with "insertMdmData_updateAssetSerialno_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath              | Value    |
                  | Result             | false    |
                  | Reason.1[0].Column | serialno |
                  | Reason.2[0].Column | serialno |
              And verify response time is less than "3000" milliseconds
              
        @UpdateAssetSeriaTest16
        Scenario: UpdateAssetSerialNoMDM - UpdateAssetSeriaTest16 - Duplicate assetserialnumber-serialno already exists for another outlet and asset-Testdata hardcoded
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_updateAssetSerialno_MDM" payload
                  | JPath                  | Value                          |
                  | data[0].assetdetail_id | DB:assetdetails:id: id=2       |
                  | data[0].serialno       | DB:assetdetails:serialno: id=1 |
                  | data[1].assetdetail_id | DB:assetdetails:id: id=2       |
                  | data[1].serialno       | DB:assetdetails:serialno: id=1 |
             When I post the request with "insertMdmData_updateAssetSerialno_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath              | Value                                                                 |
                  | Result             | false                                                                 |
                  | Reason.1[0].Column | serialno                                                              |
                  | Reason.1[0].Error  | Entered Serial Number already exists for same outlet_id and asset_id. |
                  | Reason.2[0].Column | serialno                                                              |
                  | Reason.2[0].Error  | Entered Serial Number already exists for same outlet_id and asset_id. |

              And verify response time is less than "3000" milliseconds
        @UpdateAssetSeriaTest17
        Scenario: UpdateAssetSerialNoMDM - UpdateAssetSeriaTest17 - Serialno with leading zeros (positive)
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_updateAssetSerialno_MDM" payload
                  | JPath                  | Value                                                  |
                  | data[0].assetdetail_id | DB:assetdetails:id:is_active=1 ORDER BY RAND() LIMIT 1 |
                  | data[0].serialno       | 000123456                                              |
                  | data[1].assetdetail_id | DB:assetdetails:id:is_active=1 ORDER BY RAND() LIMIT 1 |
                  | data[1].serialno       | 000000001                                              |
             When I post the request with "insertMdmData_updateAssetSerialno_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath    | Value                      |
                  | Result   | true                       |
                  | Reason.1 | Data Uploaded Successfully |
              And verify response time is less than "3000" milliseconds

        @UpdateAssetSeriaTest18
        Scenario: UpdateAssetSerialNoMDM - UpdateAssetSeriaTest18 - Serialno with non-Latin characters (positive)
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_updateAssetSerialno_MDM" payload
                  | JPath                  | Value                                                  |
                  | data[0].assetdetail_id | DB:assetdetails:id:is_active=1 ORDER BY RAND() LIMIT 1 |
                  | data[0].serialno       | テスト123                                                 |
                  | data[1].assetdetail_id | DB:assetdetails:id:is_active=1 ORDER BY RAND() LIMIT 1 |
                  | data[1].serialno       | тест456                                                |
             When I post the request with "insertMdmData_updateAssetSerialno_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath    | Value                      |
                  | Result   | true                       |
                  | Reason.1 | Data Uploaded Successfully |
              And verify response time is less than "3000" milliseconds

        @UpdateAssetSeriaTest19
        Scenario: UpdateAssetSerialNoMDM - UpdateAssetSeriaTest31 - assetdetail_id near max id (edge)
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_updateAssetSerialno_MDM" payload
                  | JPath                  | Value                                                  |
                  | data[0].assetdetail_id | DB:assetdetails:id:is_active=1 ORDER BY RAND() LIMIT 1 |
                  | data[0].serialno       | NEAR_MAX_1                                             |
                  | data[1].assetdetail_id | DB:assetdetails:id:is_active=1 ORDER BY RAND() LIMIT 1 |
                  | data[1].serialno       | NEAR_MAX_2                                             |
             When I post the request with "insertMdmData_updateAssetSerialno_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath    | Value                      |
                  | Result   | true                       |
                  | Reason.1 | Data Uploaded Successfully |
              And verify response time is less than "3000" milliseconds

        @UpdateAssetSeriaTest20
        Scenario: UpdateAssetSerialNoMDM - UpdateAssetSeriaTest20 - assetdetail_id mixed numeric and alpha (negative)
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_updateAssetSerialno_MDM" payload
                  | JPath                  | Value                                                  |
                  | data[0].assetdetail_id | "123abc"                                               |
                  | data[0].serialno       | MIXED123                                               |
                  | data[1].assetdetail_id | DB:assetdetails:id:is_active=1 ORDER BY RAND() LIMIT 1 |
                  | data[1].serialno       | randomString                                           |
             When I post the request with "insertMdmData_updateAssetSerialno_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath              | Value          |
                  | Result             | false          |
                  | Reason.1[0].Column | assetdetail_id |
              And verify response time is less than "3000" milliseconds

        @UpdateAssetSeriaTest21
        Scenario: UpdateAssetSerialNoMDM - UpdateAssetSeriaTest21 - Serialno with punctuation and spaces (positive)
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_updateAssetSerialno_MDM" payload
                  | JPath                  | Value                                                  |
                  | data[0].assetdetail_id | DB:assetdetails:id:is_active=1 ORDER BY RAND() LIMIT 1 |
                  | data[0].serialno       | " SRL #001 - A "                                       |
                  | data[1].assetdetail_id | DB:assetdetails:id:is_active=1 ORDER BY RAND() LIMIT 1 |
                  | data[1].serialno       | " SRL #002 - B "                                       |
             When I post the request with "insertMdmData_updateAssetSerialno_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath    | Value                      |
                  | Result   | true                       |
                  | Reason.1 | Data Uploaded Successfully |
              And verify response time is less than "3000" milliseconds

        @UpdateAssetSeriaTest22
        Scenario: UpdateAssetSerialNoMDM - UpdateAssetSeriaTest22 - Serialno containing hyphens and slashes (positive)
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_updateAssetSerialno_MDM" payload
                  | JPath                  | Value                                                  |
                  | data[0].assetdetail_id | DB:assetdetails:id:is_active=1 ORDER BY RAND() LIMIT 1 |
                  | data[0].serialno       | AAA-111/222                                            |
                  | data[1].assetdetail_id | DB:assetdetails:id:is_active=1 ORDER BY RAND() LIMIT 1 |
                  | data[1].serialno       | BBB-333/444                                            |
             When I post the request with "insertMdmData_updateAssetSerialno_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath    | Value                      |
                  | Result   | true                       |
                  | Reason.1 | Data Uploaded Successfully |
              And verify response time is less than "3000" milliseconds

        @UpdateAssetSeriaTest23
        Scenario: UpdateAssetSerialNoMDM - UpdateAssetSeriaTest23 - Mixed letter case serialno (positive)
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_updateAssetSerialno_MDM" payload
                  | JPath                  | Value                                                  |
                  | data[0].assetdetail_id | DB:assetdetails:id:is_active=1 ORDER BY RAND() LIMIT 1 |
                  | data[0].serialno       | AbCdEfG123                                             |
                  | data[1].assetdetail_id | DB:assetdetails:id:is_active=1 ORDER BY RAND() LIMIT 1 |
                  | data[1].serialno       | XyZ987MnO                                              |
             When I post the request with "insertMdmData_updateAssetSerialno_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath    | Value                      |
                  | Result   | true                       |
                  | Reason.1 | Data Uploaded Successfully |
              And verify response time is less than "3000" milliseconds

        @UpdateAssetSeriaTest24
        Scenario: UpdateAssetSerialNoMDM - UpdateAssetSeriaTest36 - Serialno with control characters removed (positive)
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_updateAssetSerialno_MDM" payload
                  | JPath                  | Value                                                  |
                  | data[0].assetdetail_id | DB:assetdetails:id:is_active=1 ORDER BY RAND() LIMIT 1 |
                  | data[0].serialno       | CLEANED123\u0007                                       |
                  | data[1].assetdetail_id | DB:assetdetails:id:is_active=1 ORDER BY RAND() LIMIT 1 |
                  | data[1].serialno       | CLEANED456\u0008                                       |
             When I post the request with "insertMdmData_updateAssetSerialno_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath    | Value                      |
                  | Result   | true                       |
                  | Reason.1 | Data Uploaded Successfully |
              And verify response time is less than "3000" milliseconds

        @UpdateAssetSeriaTest25
        Scenario: UpdateAssetSerialNoMDM - UpdateAssetSeriaTest25 - Serialno with emoji + text (positive)
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_updateAssetSerialno_MDM" payload
                  | JPath                  | Value                                                  |
                  | data[0].assetdetail_id | DB:assetdetails:id:is_active=1 ORDER BY RAND() LIMIT 1 |
                  | data[0].serialno       | EMOJI-🔔-123                                           |
                  | data[1].assetdetail_id | DB:assetdetails:id:is_active=1 ORDER BY RAND() LIMIT 1 |
                  | data[1].serialno       | EMOJI-⭐-456                                            |
             When I post the request with "insertMdmData_updateAssetSerialno_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath  | Value |
                  | Result | true  |
              And verify response time is less than "3000" milliseconds

        @UpdateAssetSeriaTest26
        Scenario: UpdateAssetSerialNoMDM - UpdateAssetSeriaTest26 - Serialno with intermittent dashes (positive)
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_updateAssetSerialno_MDM" payload
                  | JPath                  | Value                                                  |
                  | data[0].assetdetail_id | DB:assetdetails:id:is_active=1 ORDER BY RAND() LIMIT 1 |
                  | data[0].serialno       | 12-34-56-78                                            |
                  | data[1].assetdetail_id | DB:assetdetails:id:is_active=1 ORDER BY RAND() LIMIT 1 |
                  | data[1].serialno       | 8765-4321-00                                           |
             When I post the request with "insertMdmData_updateAssetSerialno_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath    | Value                      |
                  | Result   | true                       |
                  | Reason.1 | Data Uploaded Successfully |
              And verify response time is less than "3000" milliseconds

        @UpdateAssetSeriaTest27
        Scenario: UpdateAssetSerialNoMDM - UpdateAssetSeriaTest27 - Serialno with non-printable trimmed to visible (positive)
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_updateAssetSerialno_MDM" payload
                  | JPath                  | Value                                                  |
                  | data[0].assetdetail_id | DB:assetdetails:id:is_active=1 ORDER BY RAND() LIMIT 1 |
                  | data[0].serialno       | "\u0009TAB123"                                         |
                  | data[1].assetdetail_id | DB:assetdetails:id:is_active=1 ORDER BY RAND() LIMIT 1 |
                  | data[1].serialno       | "LINE\n456"                                            |
             When I post the request with "insertMdmData_updateAssetSerialno_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath    | Value                      |
                  | Result   | true                       |
                  | Reason.1 | Data Uploaded Successfully |
              And verify response time is less than "3000" milliseconds

        @UpdateAssetSeriaTest28
        Scenario: UpdateAssetSerialNoMDM - UpdateAssetSeriaTest28 - Serialno numeric overflow style (negative)
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_updateAssetSerialno_MDM" payload
                  | JPath                  | Value                                                            |
                  | data[0].assetdetail_id | DB:assetdetails:id:is_active=1 ORDER BY id DESC LIMIT 1 OFFSET 0 |
                  | data[0].serialno       | 999999999999999999999999999999                                   |
                  | data[1].assetdetail_id | DB:assetdetails:id:is_active=1 ORDER BY id DESC LIMIT 1 OFFSET 1 |
                  | data[1].serialno       | 888888888888888888888888888888                                   |
             When I post the request with "insertMdmData_updateAssetSerialno_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath  | Value |
                  | Result | true  |
              And verify response time is less than "3000" milliseconds











