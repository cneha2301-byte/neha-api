@AddAssetsMDM @MDM @Execution
Feature: All testcases of Assets Add  MDM

        @AddAssetTest1
        Scenario: AddAssetsMDM:AddAssetTest1 - Successful upload of new Assets data with only mandatory field 'name'
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath        | Value        |
                  | data[0].name | randomString |
                  | data[1].name | randomString |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath    | Value                      |
                  | Result   | true                       |
                  | Reason.1 | Data Uploaded Successfully |
                  | Reason.2 | Data Uploaded Successfully |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest2  @AddAssetTestBugFix
        Scenario: AddAssetsMDM:AddAssetTest2 - Data verification by passing the valid data in all the fields
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath                     | Value                                                                        |
                  | data[0].name              | AssetTest1                                                                   |
                  | data[0].description       | description1                                                                 |
                  | data[0].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[0].is_active         | 1                                                                            |
                  | data[0].is_autoapprove    | 1                                                                            |
                  | data[0].price             | 50000                                                                        |
                  | data[0].qrcodeenable      | 1                                                                            |
                  | data[0].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[0].reasonform_id     |                                                                              |
                  | data[0].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[0].is_smart_asset    | 1                                                                            |
                  | data[0].asset_type_id     | 1                                                                            |
                  | data[1].name              | AssetTest2                                                                   |
                  | data[1].description       | description2                                                                 |
                  | data[1].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[1].is_active         | 1                                                                            |
                  | data[1].is_autoapprove    | 1                                                                            |
                  | data[1].price             | 100000.00000                                                                 |
                  | data[1].name              | AssetTest2                                                                   |
                  | data[1].qrcodeenable      | 1                                                                            |
                  | data[1].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[1].reasonform_id     |                                                                              |
                  | data[1].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[1].is_smart_asset    | 1                                                                            |
                  | data[1].asset_type_id     | 1                                                                            |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
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
                  | expectedColumn                                              | expectedValue                                         |
                  | DB:assets:name: id=(SELECT MAX(id)-1 FROM assets)           | AssetTest1                                            |
                  | DB:assets:description: id=(SELECT MAX(id)-1 FROM assets)    | description1                                          |
                  | DB:assets:image: id=(SELECT MAX(id)-1 FROM assets)          | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles |
                  | DB:assets:is_active: id=(SELECT MAX(id)-1 FROM assets)      | true                                                  |
                  | DB:assets:is_autoapprove: id=(SELECT MAX(id)-1 FROM assets) | 1                                                     |
                  | DB:assets:price: id=(SELECT MAX(id)-1 FROM assets)          | 50000.0                                               |
                  | DB:assets:name: id=(SELECT MAX(id) FROM assets)             | AssetTest2                                            |
                  | DB:assets:description: id=(SELECT MAX(id) FROM assets)      | description2                                          |
                  | DB:assets:image: id=(SELECT MAX(id) FROM assets)            | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles |
                  | DB:assets:is_active: id=(SELECT MAX(id) FROM assets)        | true                                                  |
                  | DB:assets:is_autoapprove: id=(SELECT MAX(id) FROM assets)   | 1                                                     |
                  | DB:assets:price: id=(SELECT MAX(id) FROM assets)            | 100000.0                                              |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest3
        Scenario: AddAssetsMDM:AddAssetTest3 - Verify the functionality by passing the valid asset name -alphabets and alphanumeric
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath        | Value           |
                  | data[0].name | Alphabets       |
                  | data[1].name | Alphanumeric124 |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath  | Value |
                  | Result | true  |
              And I verify the data got updated as needed from DB
                  | expectedColumn                                    | expectedValue   |
                  | DB:assets:name: id=(SELECT MAX(id)-1 FROM assets) | Alphabets       |
                  | DB:assets:name: id=(SELECT MAX(id) FROM assets)   | Alphanumeric124 |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest4
        Scenario: AddAssetsMDM:AddAssetTest4 - Verify the functionality by passing the valid asset name -special characters
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath        | Value      |
                  | data[0].name | !@#$%      |
                  | data[1].name | Alpha123!@ |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath  | Value |
                  | Result | true  |
              And I verify the data got updated as needed from DB
                  | expectedColumn                                    | expectedValue |
                  | DB:assets:name: id=(SELECT MAX(id)-1 FROM assets) | !@#$%         |
                  | DB:assets:name: id=(SELECT MAX(id) FROM assets)   | Alpha123!@    |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest5
        Scenario: AddAssetsMDM:AddAssetTest5 - Verify the functionality by passing the valid asset name -numbers and decicmal values
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath        | Value        |
                  | data[0].name | 99999        |
                  | data[1].name | 9999.9999999 |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath  | Value |
                  | Result | true  |
              And I verify the data got updated as needed from DB
                  | expectedColumn                                    | expectedValue |
                  | DB:assets:name: id=(SELECT MAX(id)-1 FROM assets) | 99999         |
                  | DB:assets:name: id=(SELECT MAX(id) FROM assets)   | 9999.9999999  |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest6
        Scenario: AddAssetsMDM:AddAssetTest6 - Verify the functionality by passing the boundary values asset name -50 max 50 characters
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath        | Value                                               |
                  | data[0].name | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwx  |
                  | data[1].name | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwx1 |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath              | Value                      |
                  | Result             | false                      |
                  | Reason.1           | Data Uploaded Successfully |
                  | Reason.2[0].Column | name                       |
              And I verify the data got updated as needed from DB
                  | expectedColumn                                  | expectedValue                                      |
                  | DB:assets:name: id=(SELECT MAX(id) FROM assets) | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwx |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest7
        Scenario: AddAssetsMDM:AddAssetTest7 - Verify the functionality by passing the valid asset ERP field -alphabets and alphanumeric
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath         | Value              |
                  | data[0].name  | Alphabets          |
                  | data[0].erpno | randomString       |
                  | data[1].name  | Alphanumeric124    |
                  | data[1].erpno | randomAlphanumeric |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath  | Value |
                  | Result | true  |
              And I verify the data got updated as needed from DB
                  | expectedColumn                                     | expectedValue   |
                  | DB:assets:erpno: id=(SELECT MAX(id)-1 FROM assets) | randomString    |
                  | DB:assets:name: id=(SELECT MAX(id)-1 FROM assets)  | Alphabets       |
                  | DB:assets:name: id=(SELECT MAX(id) FROM assets)    | Alphanumeric124 |
                  | DB:assets:erpno: id=(SELECT MAX(id) FROM assets)   | randomString    |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest8
        Scenario: AddAssetsMDM:AddAssetTest8 - Verify the functionality by passing the valid asset ERP field -Special characters
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath         | Value                 |
                  | data[0].name  | Alphabets             |
                  | data[0].erpno | randomAsciiCharacters |
                  | data[1].name  | Alphanumeric124       |
                  | data[1].erpno | randomAlphanumeric    |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath  | Value |
                  | Result | true  |
              And I verify the data got updated as needed from DB
                  | expectedColumn                                     | expectedValue   |
                  | DB:assets:erpno: id=(SELECT MAX(id)-1 FROM assets) | randomString    |
                  | DB:assets:name: id=(SELECT MAX(id)-1 FROM assets)  | Alphabets       |
                  | DB:assets:name: id=(SELECT MAX(id) FROM assets)    | Alphanumeric124 |
                  | DB:assets:erpno: id=(SELECT MAX(id) FROM assets)   | randomString    |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest9
        Scenario: AddAssetsMDM:AddAssetTest9 - Verify the functionality by passing the valid asset ERP field -Numerical values
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath         | Value           |
                  | data[0].name  | Alphabets       |
                  | data[0].erpno | randomInt       |
                  | data[1].name  | Alphanumeric124 |
                  | data[1].erpno | randomDouble    |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath  | Value |
                  | Result | true  |
              And I verify the data got updated as needed from DB
                  | expectedColumn                                     | expectedValue   |
                  | DB:assets:erpno: id=(SELECT MAX(id)-1 FROM assets) | randomString    |
                  | DB:assets:name: id=(SELECT MAX(id)-1 FROM assets)  | Alphabets       |
                  | DB:assets:name: id=(SELECT MAX(id) FROM assets)    | Alphanumeric124 |
                  | DB:assets:erpno: id=(SELECT MAX(id) FROM assets)   | randomString    |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest10
        Scenario: AddAssetsMDM:AddAssetTest10 - Verify the functionality by passing the boundary values for erpno column
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath         | Value           |
                  | data[0].name  | Alphabets       |
                  | data[0].erpno | randomString:50 |
                  | data[1].name  | Alphanumeric124 |
                  | data[1].erpno | randomString:51 |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath              | Value                      |
                  | Result             | false                      |
                  | Reason.1           | Data Uploaded Successfully |
                  | Reason.2[0].Column | erpno                      |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest11 @AddAssetTestBugFix
        Scenario: AddAssetsMDM:AddAssetTest11 - Verify the functionality by passing the duplicate erpno-error should be thrown
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath         | Value                             |
                  | data[0].name  | Alphabets                         |
                  | data[0].erpno | DB:assets:erpno:erpno IS NOT NULL |
                  | data[1].name  | Alphanumeric124                   |
                  | data[1].erpno | DB:assets:erpno:erpno IS NOT NULL |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath              | Value |
                  | Result             | false |
                  | Reason.2[0].Column | erpno |
                  | Reason.2[0].Column | erpno |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest12
        Scenario: AddAssetsMDM:AddAssetTest12 - Valid boolean values for is_active,is_autoapprove,qrcodeenable,is_smart_asset,is_deleted,skip_asset_order_approval_flow
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath                                  | Value        |
                  | data[0].name                           | randomString |
                  | data[0].is_active                      | 1            |
                  | data[0].is_autoapprove                 | 1            |
                  | data[0].qrcodeenable                   | 1            |
                  | data[0].is_smart_asset                 | 1            |
                  | data[0].is_deleted                     | 1            |
                  | data[0].skip_asset_order_approval_flow | 1            |
                  | data[1].name                           | randomString |
                  | data[1].is_active                      | 0            |
                  | data[1].is_autoapprove                 | 0            |
                  | data[1].qrcodeenable                   | 0            |
                  | data[1].is_smart_asset                 | 0            |
                  | data[1].is_deleted                     | 0            |
                  | data[1].skip_asset_order_approval_flow | 0            |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
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
                  | expectedColumn                                                              | expectedValue |
                  | DB:assets:name: id=(SELECT MAX(id)-1 FROM assets)                           | randomString  |
                  | DB:assets:is_active: id=(SELECT MAX(id)-1 FROM assets)                      | true          |
                  | DB:assets:is_autoapprove: id=(SELECT MAX(id)-1 FROM assets)                 | 1             |
                  | DB:assets:qrcodeenable: id=(SELECT MAX(id)-1 FROM assets)                   | true          |
                  | DB:assets:is_smart_asset: id=(SELECT MAX(id)-1 FROM assets)                 | 1             |
                  | DB:assets:is_deleted: id=(SELECT MAX(id)-1 FROM assets)                     | 1             |
                  | DB:assets:skip_asset_order_approval_flow: id=(SELECT MAX(id)-1 FROM assets) | true          |
                  | DB:assets:name: id=(SELECT MAX(id) FROM assets)                             | randomString  |
                  | DB:assets:is_active: id=(SELECT MAX(id) FROM assets)                        | false         |
                  | DB:assets:is_autoapprove: id=(SELECT MAX(id) FROM assets)                   | 0             |
                  | DB:assets:qrcodeenable: id=(SELECT MAX(id) FROM assets)                     | false         |
                  | DB:assets:is_smart_asset: id=(SELECT MAX(id) FROM assets)                   | 0             |
                  | DB:assets:is_deleted: id=(SELECT MAX(id) FROM assets)                       | 0             |
                  | DB:assets:skip_asset_order_approval_flow: id=(SELECT MAX(id) FROM assets)   | false         |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest13
        Scenario: AddAssetsMDM:AddAssetTest13 - Non-boolean values for is_active,is_autoapprove,qrcodeenable,is_smart_asset,is_deleted,skip_asset_order_approval_flow
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath                                  | Value        |
                  | data[0].name                           | randomString |
                  | data[0].is_active                      | 2            |
                  | data[0].is_autoapprove                 | 2            |
                  | data[0].qrcodeenable                   | 2            |
                  | data[0].is_smart_asset                 | 2            |
                  | data[0].is_deleted                     | 2            |
                  | data[0].skip_asset_order_approval_flow | 2            |
                  | data[1].name                           | randomString |
                  | data[1].is_active                      | -1           |
                  | data[1].is_autoapprove                 | -1           |
                  | data[1].qrcodeenable                   | -1           |
                  | data[1].is_smart_asset                 | -1           |
                  | data[1].is_deleted                     | -1           |
                  | data[1].skip_asset_order_approval_flow | -1           |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath              | Value          |
                  | Result             | false          |
                  | Reason.1[0].Column | is_active      |
                  | Reason.1[1].Column | is_autoapprove |
                  | Reason.1[2].Column | qrcodeenable   |
                  | Reason.1[3].Column | is_smart_asset |
                  | Reason.1[4].Column | is_deleted     |
                  | Reason.2[0].Column | is_active      |
                  | Reason.2[1].Column | is_autoapprove |
                  | Reason.2[2].Column | qrcodeenable   |
                  | Reason.2[3].Column | is_smart_asset |
                  | Reason.2[4].Column | is_deleted     |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest14
        Scenario: AddAssetsMDM:AddAssetTest14 - Non-boolean values for is_active,is_autoapprove,qrcodeenable,is_smart_asset,is_deleted,skip_asset_order_approval_flow
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath                                  | Value              |
                  | data[0].name                           | randomString       |
                  | data[0].is_active                      | randomString       |
                  | data[0].is_autoapprove                 | randomString       |
                  | data[0].qrcodeenable                   | randomString       |
                  | data[0].is_smart_asset                 | randomString       |
                  | data[0].is_deleted                     | randomString       |
                  | data[0].skip_asset_order_approval_flow | randomString       |
                  | data[1].name                           | randomString       |
                  | data[1].is_active                      | randomAlphaNumeric |
                  | data[1].is_autoapprove                 | randomAlphaNumeric |
                  | data[1].qrcodeenable                   | randomAlphaNumeric |
                  | data[1].is_smart_asset                 | randomAlphaNumeric |
                  | data[1].is_deleted                     | randomAlphaNumeric |
                  | data[1].skip_asset_order_approval_flow | randomAlphaNumeric |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath              | Value          |
                  | Result             | false          |
                  | Reason.1[0].Column | is_active      |
                  | Reason.1[1].Column | is_autoapprove |
                  | Reason.1[2].Column | qrcodeenable   |
                  | Reason.1[3].Column | is_smart_asset |
                  | Reason.1[4].Column | is_deleted     |
                  | Reason.2[0].Column | is_active      |
                  | Reason.2[1].Column | is_autoapprove |
                  | Reason.2[2].Column | qrcodeenable   |
                  | Reason.2[3].Column | is_smart_asset |
                  | Reason.2[4].Column | is_deleted     |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest15
        Scenario: AddAssetsMDM:AddAssetTest15 - Non-boolean values for is_active,is_autoapprove,qrcodeenable,is_smart_asset,is_deleted,skip_asset_order_approval_flow
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath                                  | Value        |
                  | data[0].name                           | randomString |
                  | data[0].is_active                      | randomInt    |
                  | data[0].is_autoapprove                 | randomInt    |
                  | data[0].qrcodeenable                   | randomInt    |
                  | data[0].is_smart_asset                 | randomInt    |
                  | data[0].is_deleted                     | randomInt    |
                  | data[0].skip_asset_order_approval_flow | randomInt    |
                  | data[1].name                           | randomString |
                  | data[1].is_active                      | randomDouble |
                  | data[1].is_autoapprove                 | randomDouble |
                  | data[1].qrcodeenable                   | randomDouble |
                  | data[1].is_smart_asset                 | randomDouble |
                  | data[1].is_deleted                     | randomDouble |
                  | data[1].skip_asset_order_approval_flow | randomDouble |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath              | Value          |
                  | Result             | false          |
                  | Reason.1[0].Column | is_active      |
                  | Reason.1[1].Column | is_autoapprove |
                  | Reason.1[2].Column | qrcodeenable   |
                  | Reason.1[3].Column | is_smart_asset |
                  | Reason.1[4].Column | is_deleted     |
                  | Reason.2[0].Column | is_active      |
                  | Reason.2[1].Column | is_autoapprove |
                  | Reason.2[2].Column | qrcodeenable   |
                  | Reason.2[3].Column | is_smart_asset |
                  | Reason.2[4].Column | is_deleted     |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest16
        Scenario: AddAssetsMDM:AddAssetTest16 - Valid values into price column
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath         | Value        |
                  | data[0].name  | randomString |
                  | data[0].price | 87654        |
                  | data[1].name  | randomString |
                  | data[1].price | 87654.98438  |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
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
                  | expectedColumn                                     | expectedValue |
                  | DB:assets:name: id=(SELECT MAX(id)-1 FROM assets)  | randomString  |
                  | DB:assets:price: id=(SELECT MAX(id)-1 FROM assets) | 87654.0       |
                  | DB:assets:name: id=(SELECT MAX(id) FROM assets)    | randomString  |
                  | DB:assets:price: id=(SELECT MAX(id) FROM assets)   | 87654.984     |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest17
        Scenario: AddAssetsMDM:AddAssetTest17 - Valid values into price column -negative values
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath         | Value        |
                  | data[0].name  | randomString |
                  | data[0].price | -10000       |
                  | data[1].name  | randomString |
                  | data[1].price | -98765       |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
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
                  | expectedColumn                                     | expectedValue |
                  | DB:assets:name: id=(SELECT MAX(id)-1 FROM assets)  | randomString  |
                  | DB:assets:price: id=(SELECT MAX(id)-1 FROM assets) | -10000.0      |
                  | DB:assets:name: id=(SELECT MAX(id) FROM assets)    | randomString  |
                  | DB:assets:price: id=(SELECT MAX(id) FROM assets)   | -98765.0      |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest18
        Scenario: AddAssetsMDM:AddAssetTest18 - InValid values into price column
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath         | Value              |
                  | data[0].name  | randomString       |
                  | data[0].price | randomString       |
                  | data[1].name  | randomString       |
                  | data[1].price | randomAlphanumeric |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath              | Value |
                  | Result             | false |
                  | Reason.1[0].Column | price |
                  | Reason.2[0].Column | price |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest19
        Scenario: AddAssetsMDM:AddAssetTest19 - InValid values into price column
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath         | Value                 |
                  | data[0].name  | randomString          |
                  | data[0].price | randomAsciiCharacters |
                  | data[1].name  | randomString          |
                  | data[1].price | !@#$%^&*              |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath              | Value |
                  | Result             | false |
                  | Reason.1[0].Column | price |
                  | Reason.2[0].Column | price |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest20
        Scenario: AddAssetsMDM:AddAssetTest20 - Verify the functionality by passing the valid asset description column -alphabets and alphanumeric
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath               | Value           |
                  | data[0].name        | Alphabets       |
                  | data[0].description | Alphabets       |
                  | data[1].name        | Alphanumeric124 |
                  | data[1].description | Alphanumeric124 |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath  | Value |
                  | Result | true  |
              And I verify the data got updated as needed from DB
                  | expectedColumn                                           | expectedValue   |
                  | DB:assets:name: id=(SELECT MAX(id)-1 FROM assets)        | Alphabets       |
                  | DB:assets:description: id=(SELECT MAX(id)-1 FROM assets) | Alphabets       |
                  | DB:assets:name: id=(SELECT MAX(id) FROM assets)          | Alphanumeric124 |
                  | DB:assets:description: id=(SELECT MAX(id) FROM assets)   | Alphanumeric124 |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest21
        Scenario: AddAssetsMDM:AddAssetTest21 - Verify the functionality by passing the valid asset description column -special characters
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath               | Value              |
                  | data[0].name        | Alphabets          |
                  | data[0].description | hi hello           |
                  | data[1].name        | Alphanumeric124    |
                  | data[1].description | !@#$%^&*()(*&^%$#@ |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath  | Value |
                  | Result | true  |
              And I verify the data got updated as needed from DB
                  | expectedColumn                                           | expectedValue      |
                  | DB:assets:name: id=(SELECT MAX(id)-1 FROM assets)        | Alphabets          |
                  | DB:assets:description: id=(SELECT MAX(id)-1 FROM assets) | hi hello           |
                  | DB:assets:name: id=(SELECT MAX(id) FROM assets)          | Alphanumeric124    |
                  | DB:assets:description: id=(SELECT MAX(id) FROM assets)   | !@#$%^&*()(*&^%$#@ |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest22
        Scenario: AddAssetsMDM:AddAssetTest22 - Verify the functionality by passing the valid asset description column -numerical values
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath               | Value                 |
                  | data[0].name        | Alphabets             |
                  | data[0].description | 12345678912345678     |
                  | data[1].name        | Alphanumeric124       |
                  | data[1].description | 123456789.12345678... |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath  | Value |
                  | Result | true  |
              And I verify the data got updated as needed from DB
                  | expectedColumn                                           | expectedValue         |
                  | DB:assets:name: id=(SELECT MAX(id)-1 FROM assets)        | Alphabets             |
                  | DB:assets:description: id=(SELECT MAX(id)-1 FROM assets) | 12345678912345678     |
                  | DB:assets:name: id=(SELECT MAX(id) FROM assets)          | Alphanumeric124       |
                  | DB:assets:description: id=(SELECT MAX(id) FROM assets)   | 123456789.12345678... |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest23
        Scenario: AddAssetsMDM:AddAssetTest23 - Verify the functionality by passing the boundary values asset name -50 max 50 characters
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath               | Value                                                                                                |
                  | data[0].name        | randomString                                                                                         |
                  | data[0].description | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwx |
                  | data[1].name        | randomString                                                                                         |
                  | data[1].description | randomString:101                                                                                     |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath              | Value                      |
                  | Result             | false                      |
                  | Reason.1           | Data Uploaded Successfully |
                  | Reason.2[0].Column | description                |
              And I verify the data got updated as needed from DB
                  | expectedColumn                                         | expectedValue                                                                                        |
                  | DB:assets:description: id=(SELECT MAX(id) FROM assets) | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwx |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest24
        Scenario: AddAssetsMDM:AddAssetTest24 - Verify the functionality by passing valid and active asset type id
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath                 | Value                         |
                  | data[0].name          | randomString                  |
                  | data[0].asset_type_id | DB:asset_types:id:is_active=1 |
                  | data[1].name          | randomString                  |
                  | data[1].asset_type_id | DB:asset_types:id:is_active=1 |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
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
                  | expectedColumn                                             | expectedValue                 |
                  | DB:assets:name: id=(SELECT MAX(id)-1 FROM assets)          | randomString                  |
                  | DB:assets:asset_type_id: id=(SELECT MAX(id)-1 FROM assets) | DB:asset_types:id:is_active=1 |
                  | DB:assets:name: id=(SELECT MAX(id) FROM assets)            | randomString                  |
                  | DB:assets:asset_type_id: id=(SELECT MAX(id) FROM assets)   | DB:asset_types:id:is_active=1 |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest25  @AddAssetTestBugFix
        Scenario: AddAssetsMDM:AddAssetTest25 - Verify the functionality by passing and in_active asset type id
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath                 | Value                         |
                  | data[0].name          | randomString                  |
                  | data[0].asset_type_id | DB:asset_types:id:is_active=0 |
                  | data[1].name          | randomString                  |
                  | data[1].asset_type_id | DB:asset_types:id:is_active=0 |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath              | Value         |
                  | Result             | false         |
                  | Reason.1[0].Column | asset_type_id |
                  | Reason.2[0].Column | asset_type_id |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest26  @AddAssetTestBugFix
        Scenario: AddAssetsMDM:AddAssetTest26 - Verify the functionality by passing invalid asset type id
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath                 | Value        |
                  | data[0].name          | randomString |
                  | data[0].asset_type_id | -1           |
                  | data[1].name          | randomString |
                  | data[1].asset_type_id | 0            |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath              | Value         |
                  | Result             | false         |
                  | Reason.1[0].Column | asset_type_id |
                  | Reason.2[0].Column | asset_type_id |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest27
        Scenario: AddAssetsMDM:AddAssetTest27 - Verify the functionality by passing invalid asset type id
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath                 | Value        |
                  | data[0].name          | randomString |
                  | data[0].asset_type_id | randomString |
                  | data[1].name          | randomString |
                  | data[1].asset_type_id | randomString |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath              | Value         |
                  | Result             | false         |
                  | Reason.1[0].Column | asset_type_id |
                  | Reason.2[0].Column | asset_type_id |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest28
        Scenario: AddAssetsMDM:AddAssetTest28 - Verify the functionality by passing valid and active auditform_id
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath                | Value                                                                    |
                  | data[0].name         | randomString                                                             |
                  | data[0].auditform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%' |
                  | data[1].name         | randomString                                                             |
                  | data[1].auditform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%' |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath    | Value                      |
                  | Result   | true                       |
                  | Reason.1 | Data Uploaded Successfully |
                  | Reason.2 | Data Uploaded Successfully |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest29
        Scenario: AddAssetsMDM:AddAssetTest29 - Verify the functionality by passing inactive auditform_id
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath                | Value                                                                    |
                  | data[0].name         | randomString                                                             |
                  | data[0].auditform_id | DB:activityformfields:id:active=0 AND activity_type LIKE '%assetaudits%' |
                  | data[1].name         | randomString                                                             |
                  | data[1].auditform_id | DB:activityformfields:id:active=0 AND activity_type LIKE '%assetaudits%' |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath              | Value        |
                  | Result             | false        |
                  | Reason.1[0].Column | auditform_id |
                  | Reason.1[0].Column | auditform_id |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest30 @AddAssetTugFix
        Scenario: AddAssetsMDM:AddAssetTest30 - Verify the functionality by passing invalid auditform_id
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath                | Value        |
                  | data[0].name         | randomString |
                  | data[0].auditform_id | -1           |
                  | data[1].name         | randomString |
                  | data[1].auditform_id | 0            |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath              | Value        |
                  | Result             | false        |
                  | Reason.1[0].Column | auditform_id |
                  | Reason.1[0].Column | auditform_id |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest31
        Scenario: AddAssetsMDM:AddAssetTest31 - Verify the functionality by passing invalid auditform_id
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath                | Value                 |
                  | data[0].name         | randomString          |
                  | data[0].auditform_id | randomString          |
                  | data[1].name         | randomString          |
                  | data[1].auditform_id | randomAsciiCharacters |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath              | Value        |
                  | Result             | false        |
                  | Reason.1[0].Column | auditform_id |
                  | Reason.1[0].Column | auditform_id |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest32
        Scenario: AddAssetsMDM:AddAssetTest32 - Verify the functionality by passing valid and active deregisterform_id
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath                     | Value                                                                        |
                  | data[0].name              | randomString                                                                 |
                  | data[0].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[1].name              | randomString                                                                 |
                  | data[1].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath    | Value                      |
                  | Result   | true                       |
                  | Reason.1 | Data Uploaded Successfully |
                  | Reason.2 | Data Uploaded Successfully |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest33
        Scenario: AddAssetsMDM:AddAssetTest33 - Verify the functionality by passing inactive deregisterform_id
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath                     | Value                                                                        |
                  | data[0].name              | randomString                                                                 |
                  | data[0].deregisterform_id | DB:activityformfields:id:active=0 AND activity_type LIKE '%assetderegister%' |
                  | data[1].name              | randomString                                                                 |
                  | data[1].deregisterform_id | DB:activityformfields:id:active=0 AND activity_type LIKE '%assetderegister%' |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath              | Value                                  |
                  | Result             | false                                  |
                  | Reason.1[0].Column | deregisterform_id                      |
                  | Reason.1[0].Error  | Entered deregisterform_id is inactive. |
                  | Reason.1[0].Column | deregisterform_id                      |
                  | Reason.2[0].Error  | Entered deregisterform_id is inactive. |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest34   @AddAssetTestBugFix
        Scenario: AddAssetsMDM:AddAssetTest34 - Verify the functionality by passing invalid deregisterform_id
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath                     | Value        |
                  | data[0].name              | randomString |
                  | data[0].deregisterform_id | -1           |
                  | data[1].name              | randomString |
                  | data[1].deregisterform_id | 0            |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath              | Value             |
                  | Result             | false             |
                  | Reason.1[0].Column | deregisterform_id |
                  | Reason.1[0].Column | deregisterform_id |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest35
        Scenario: AddAssetsMDM:AddAssetTest35 - Verify the functionality by passing invalid deregisterform_id
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath                     | Value                 |
                  | data[0].name              | randomString          |
                  | data[0].deregisterform_id | randomString          |
                  | data[1].name              | randomString          |
                  | data[1].deregisterform_id | randomAsciiCharacters |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath              | Value             |
                  | Result             | false             |
                  | Reason.1[0].Column | deregisterform_id |
                  | Reason.1[0].Column | deregisterform_id |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest36
        Scenario: AddAssetsMDM:AddAssetTest36 - Verify the functionality by passing valid and active activityform_id
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath                   | Value                                                                     |
                  | data[0].name            | randomString                                                              |
                  | data[0].activityform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetdetails%' |
                  | data[1].name            | randomString                                                              |
                  | data[1].activityform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetdetails%' |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath    | Value                      |
                  | Result   | true                       |
                  | Reason.1 | Data Uploaded Successfully |
                  | Reason.2 | Data Uploaded Successfully |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest37
        Scenario: AddAssetsMDM:AddAssetTest37 - Verify the functionality by passing inactive activityform_id
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath                   | Value                                                                       |
                  | data[0].name            | randomString                                                                |
                  | data[0].activityform_id | DB:activityformfields:id:active=0 AND activity_type LIKE '%AddAssetTest36%' |
                  | data[1].name            | randomString                                                                |
                  | data[1].activityform_id | DB:activityformfields:id:active=0 AND activity_type LIKE '%AddAssetTest36%' |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath              | Value                                |
                  | Result             | false                                |
                  | Reason.1[0].Column | activityform_id                      |
                  | Reason.1[0].Error  | Entered activityform_id is inactive. |
                  | Reason.1[0].Column | activityform_id                      |
                  | Reason.2[0].Error  | Entered activityform_id is inactive. |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest38   @AddAssetTestBugFix
        Scenario: AddAssetsMDM:AddAssetTest38 - Verify the functionality by passing invalid activityform_id
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath                   | Value        |
                  | data[0].name            | randomString |
                  | data[0].activityform_id | -1           |
                  | data[1].name            | randomString |
                  | data[1].activityform_id | 0            |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath              | Value             |
                  | Result             | false             |
                  | Reason.1[0].Column | deregisterform_id |
                  | Reason.1[0].Column | deregisterform_id |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest39
        Scenario: AddAssetsMDM:AddAssetTest39 - Verify the functionality by passing invalid activityform_id
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath                   | Value                 |
                  | data[0].name            | randomString          |
                  | data[0].activityform_id | randomString          |
                  | data[1].name            | randomString          |
                  | data[1].activityform_id | randomAsciiCharacters |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath              | Value           |
                  | Result             | false           |
                  | Reason.1[0].Column | activityform_id |
                  | Reason.1[0].Column | activityform_id |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest40
        Scenario: AddAssetsMDM:AddAssetTest40 - Verify the functionality by passing valid and active reasonform_id
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath                 | Value                                              |
                  | data[0].name          | randomString                                       |
                  | data[0].reasonform_id | DB:reasons:id:is_active=1 AND reasoncategory_id=35 |
                  | data[1].name          | randomString                                       |
                  | data[1].reasonform_id | DB:reasons:id:is_active=1 AND reasoncategory_id=35 |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath    | Value                      |
                  | Result   | true                       |
                  | Reason.1 | Data Uploaded Successfully |
                  | Reason.2 | Data Uploaded Successfully |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest41
        Scenario: AddAssetsMDM:AddAssetTest41 - Verify the functionality by passing inactive reasonform_id
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath                 | Value                                              |
                  | data[0].name          | randomString                                       |
                  | data[0].reasonform_id | DB:reasons:id:is_active=0 AND reasoncategory_id=35 |
                  | data[1].name          | randomString                                       |
                  | data[1].reasonform_id | DB:reasons:id:is_active=0 AND reasoncategory_id=35 |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath              | Value         |
                  | Result             | false         |
                  | Reason.1[0].Column | reasonform_id |
                  | Reason.1[0].Column | reasonform_id |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest42   @AddAssetTestBugFix
        Scenario: AddAssetsMDM:AddAssetTest42 - Verify the functionality by passing invalid reasonform_id
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath                 | Value        |
                  | data[0].name          | randomString |
                  | data[0].reasonform_id | -1           |
                  | data[1].name          | randomString |
                  | data[1].reasonform_id | 0            |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath              | Value         |
                  | Result             | false         |
                  | Reason.1[0].Column | reasonform_id |
                  | Reason.1[0].Column | reasonform_id |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest43  @AddAssetTestBugFix
        Scenario: AddAssetsMDM:AddAssetTest43 - Verify the functionality by passing invalid reasonform_id
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath                 | Value                 |
                  | data[0].name          | randomString          |
                  | data[0].reasonform_id | randomString          |
                  | data[1].name          | randomString          |
                  | data[1].reasonform_id | randomAsciiCharacters |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath              | Value         |
                  | Result             | false         |
                  | Reason.1[0].Column | reasonform_id |
                  | Reason.1[0].Column | reasonform_id |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest44 @AddAssetTestBugFix
        Scenario: AddAssetsMDM:AddAssetTest44 - Not passing the mandatory fields-Name
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath         | Value     |
                  | data[0].price | randomInt |
                  | data[1].price | randomInt |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath             | Value |
                  | Result            | false |
                  | Reason.1[0].Error | name  |
                  | Reason.2[0].Error | name  |
              And verify response time is less than "3000" milliseconds

        @AssAssetTest45
        Scenario: AddAssetsMDM:AddAssetTest45 - Empty JSON
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath             | Value                                 |
                  | Result            | false                                 |
                  | Reason.1[0].Error | There is no data to insert or update. |
                  | Reason.2[0].Error | There is no data to insert or update. |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest46
        Scenario: AddAssetsMDM:AddAssetTest46 - Verify the functionality by passing the valid asset image url
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath         | Value                                                    |
                  | data[0].name  | Alphabets                                                |
                  | data[0].image | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles    |
                  | data[1].name  | Alphanumeric124                                          |
                  | data[1].image | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles123 |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath  | Value |
                  | Result | true  |
              And I verify the data got updated as needed from DB
                  | expectedColumn                                     | expectedValue                                            |
                  | DB:assets:name: id=(SELECT MAX(id)-1 FROM assets)  | Alphabets                                                |
                  | DB:assets:image: id=(SELECT MAX(id)-1 FROM assets) | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles    |
                  | DB:assets:name: id=(SELECT MAX(id) FROM assets)    | Alphanumeric124                                          |
                  | DB:assets:image: id=(SELECT MAX(id) FROM assets)   | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles123 |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest47
        Scenario: AddAssetsMDM:AddAssetTest47 - Verify the functionality by passing the invalid asset image url
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath         | Value                                               |
                  | data[0].name  | Alphabets                                           |
                  | data[0].image | https://example.com/image1.png                      |
                  | data[1].name  | Alphanumeric124                                     |
                  | data[1].image | https://images.unsplash.com/photo-1587614382346.jpg |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath  | Value |
                  | Result | false |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest48
        Scenario: AddAssetsMDM:AddAssetTest48 - Verify the functionality by passing the boundary values for image column
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath         | Value                                                                                                                                                                                                                                                             |
                  | data[0].name  | Alphabets                                                                                                                                                                                                                                                         |
                  | data[0].image | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles/aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa  |
                  | data[1].name  | Alphanumeric124                                                                                                                                                                                                                                                   |
                  | data[1].image | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles/aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath              | Value |
                  | Result             | false |
                  | Reason.1[0].Column | image |
                  | Reason.2[0].Column | image |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest49
        Scenario: AddAssetsMDM:AddAssetTest49 - Verify the functionality by passing the boundary values for image column
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_addAssets_MDM" payload
                  | JPath         | Value                 |
                  | data[0].name  | Alphabets             |
                  | data[0].image | randomString          |
                  | data[1].name  | Alphanumeric124       |
                  | data[1].image | randomAsciiCharacters |
             When I post the request with "insertMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath              | Value |
                  | Result             | false |
                  | Reason.1[0].Column | image |
                  | Reason.2[0].Column | image |
              And verify response time is less than "3000" milliseconds

        @AddAssetTest50  @AddAssetTestBugFix
        Scenario: AddAssetsMDM:AddAssetTest50 - Bulk upload
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertBulkMdmData_addAssets_MDM" payload
                  | JPath                     | Value                                                                        |
                  | data[0].name              | AssetTest1                                                                   |
                  | data[0].description       | description1                                                                 |
                  | data[0].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[0].is_active         | 1                                                                            |
                  | data[0].is_autoapprove    | 1                                                                            |
                  | data[0].price             | 50000                                                                        |
                  | data[0].qrcodeenable      | 1                                                                            |
                  | data[0].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[0].reasonform_id     |                                                                              |
                  | data[0].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[0].is_smart_asset    | 1                                                                            |
                  | data[0].asset_type_id     | 1                                                                            |

                  | data[1].name              | AssetTest1                                                                   |
                  | data[1].description       | description1                                                                 |
                  | data[1].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[1].is_active         | 1                                                                            |
                  | data[1].is_autoapprove    | 1                                                                            |
                  | data[1].price             | 50000                                                                        |
                  | data[1].qrcodeenable      | 1                                                                            |
                  | data[1].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[1].reasonform_id     |                                                                              |
                  | data[1].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[1].is_smart_asset    | 1                                                                            |
                  | data[1].asset_type_id     | 1                                                                            |

                  | data[2].name              | AssetTest1                                                                   |
                  | data[2].description       | description1                                                                 |
                  | data[2].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[2].is_active         | 1                                                                            |
                  | data[2].is_autoapprove    | 1                                                                            |
                  | data[2].price             | 50000                                                                        |
                  | data[2].qrcodeenable      | 1                                                                            |
                  | data[2].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[2].reasonform_id     |                                                                              |
                  | data[2].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[2].is_smart_asset    | 1                                                                            |
                  | data[2].asset_type_id     | 1                                                                            |

                  | data[3].name              | AssetTest1                                                                   |
                  | data[3].description       | description1                                                                 |
                  | data[3].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[3].is_active         | 1                                                                            |
                  | data[3].is_autoapprove    | 1                                                                            |
                  | data[3].price             | 50000                                                                        |
                  | data[3].qrcodeenable      | 1                                                                            |
                  | data[3].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[3].reasonform_id     |                                                                              |
                  | data[3].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[3].is_smart_asset    | 1                                                                            |
                  | data[3].asset_type_id     | 1                                                                            |

                  | data[4].name              | AssetTest1                                                                   |
                  | data[4].description       | description1                                                                 |
                  | data[4].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[4].is_active         | 1                                                                            |
                  | data[4].is_autoapprove    | 1                                                                            |
                  | data[4].price             | 50000                                                                        |
                  | data[4].qrcodeenable      | 1                                                                            |
                  | data[4].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[4].reasonform_id     |                                                                              |
                  | data[4].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[4].is_smart_asset    | 1                                                                            |
                  | data[4].asset_type_id     | 1                                                                            |

                  | data[5].name              | AssetTest1                                                                   |
                  | data[5].description       | description1                                                                 |
                  | data[5].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[5].is_active         | 1                                                                            |
                  | data[5].is_autoapprove    | 1                                                                            |
                  | data[5].price             | 50000                                                                        |
                  | data[5].qrcodeenable      | 1                                                                            |
                  | data[5].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[5].reasonform_id     |                                                                              |
                  | data[5].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[5].is_smart_asset    | 1                                                                            |
                  | data[5].asset_type_id     | 1                                                                            |

                  | data[6].name              | AssetTest1                                                                   |
                  | data[6].description       | description1                                                                 |
                  | data[6].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[6].is_active         | 1                                                                            |
                  | data[6].is_autoapprove    | 1                                                                            |
                  | data[6].price             | 50000                                                                        |
                  | data[6].qrcodeenable      | 1                                                                            |
                  | data[6].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[6].reasonform_id     |                                                                              |
                  | data[6].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[6].is_smart_asset    | 1                                                                            |
                  | data[6].asset_type_id     | 1                                                                            |

                  | data[7].name              | AssetTest1                                                                   |
                  | data[7].description       | description1                                                                 |
                  | data[7].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[7].is_active         | 1                                                                            |
                  | data[7].is_autoapprove    | 1                                                                            |
                  | data[7].price             | 50000                                                                        |
                  | data[7].qrcodeenable      | 1                                                                            |
                  | data[7].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[7].reasonform_id     |                                                                              |
                  | data[7].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[7].is_smart_asset    | 1                                                                            |
                  | data[7].asset_type_id     | 1                                                                            |

                  | data[8].name              | AssetTest1                                                                   |
                  | data[8].description       | description1                                                                 |
                  | data[8].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[8].is_active         | 1                                                                            |
                  | data[8].is_autoapprove    | 1                                                                            |
                  | data[8].price             | 50000                                                                        |
                  | data[8].qrcodeenable      | 1                                                                            |
                  | data[8].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[8].reasonform_id     |                                                                              |
                  | data[8].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[8].is_smart_asset    | 1                                                                            |
                  | data[8].asset_type_id     | 1                                                                            |

                  | data[9].name              | AssetTest1                                                                   |
                  | data[9].description       | description1                                                                 |
                  | data[9].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[9].is_active         | 1                                                                            |
                  | data[9].is_autoapprove    | 1                                                                            |
                  | data[9].price             | 50000                                                                        |
                  | data[9].qrcodeenable      | 1                                                                            |
                  | data[9].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[9].reasonform_id     |                                                                              |
                  | data[9].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[9].is_smart_asset    | 1                                                                            |
                  | data[9].asset_type_id     | 1                                                                            |

                  | data[10].name              | AssetTest1                                                                   |
                  | data[10].description       | description1                                                                 |
                  | data[10].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[10].is_active         | 1                                                                            |
                  | data[10].is_autoapprove    | 1                                                                            |
                  | data[10].price             | 50000                                                                        |
                  | data[10].qrcodeenable      | 1                                                                            |
                  | data[10].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[10].reasonform_id     |                                                                              |
                  | data[10].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[10].is_smart_asset    | 1                                                                            |
                  | data[10].asset_type_id     | 1                                                                            |

                  | data[11].name              | AssetTest1                                                                   |
                  | data[11].description       | description1                                                                 |
                  | data[11].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[11].is_active         | 1                                                                            |
                  | data[11].is_autoapprove    | 1                                                                            |
                  | data[11].price             | 50000                                                                        |
                  | data[11].qrcodeenable      | 1                                                                            |
                  | data[11].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[11].reasonform_id     |                                                                              |
                  | data[11].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[11].is_smart_asset    | 1                                                                            |
                  | data[11].asset_type_id     | 1                                                                            |

                  | data[12].name              | AssetTest1                                                                   |
                  | data[12].description       | description1                                                                 |
                  | data[12].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[12].is_active         | 1                                                                            |
                  | data[12].is_autoapprove    | 1                                                                            |
                  | data[12].price             | 50000                                                                        |
                  | data[12].qrcodeenable      | 1                                                                            |
                  | data[12].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[12].reasonform_id     |                                                                              |
                  | data[12].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[12].is_smart_asset    | 1                                                                            |
                  | data[12].asset_type_id     | 1                                                                            |

                  | data[13].name              | AssetTest1                                                                   |
                  | data[13].description       | description1                                                                 |
                  | data[13].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[13].is_active         | 1                                                                            |
                  | data[13].is_autoapprove    | 1                                                                            |
                  | data[13].price             | 50000                                                                        |
                  | data[13].qrcodeenable      | 1                                                                            |
                  | data[13].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[13].reasonform_id     |                                                                              |
                  | data[13].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[13].is_smart_asset    | 1                                                                            |
                  | data[13].asset_type_id     | 1                                                                            |

                  | data[14].name              | AssetTest1                                                                   |
                  | data[14].description       | description1                                                                 |
                  | data[14].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[14].is_active         | 1                                                                            |
                  | data[14].is_autoapprove    | 1                                                                            |
                  | data[14].price             | 50000                                                                        |
                  | data[14].qrcodeenable      | 1                                                                            |
                  | data[14].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[14].reasonform_id     |                                                                              |
                  | data[14].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[14].is_smart_asset    | 1                                                                            |
                  | data[14].asset_type_id     | 1                                                                            |

                  | data[15].name              | AssetTest1                                                                   |
                  | data[15].description       | description1                                                                 |
                  | data[15].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[15].is_active         | 1                                                                            |
                  | data[15].is_autoapprove    | 1                                                                            |
                  | data[15].price             | 50000                                                                        |
                  | data[15].qrcodeenable      | 1                                                                            |
                  | data[15].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[15].reasonform_id     |                                                                              |
                  | data[15].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[15].is_smart_asset    | 1                                                                            |
                  | data[15].asset_type_id     | 1                                                                            |

                  | data[16].name              | AssetTest1                                                                   |
                  | data[16].description       | description1                                                                 |
                  | data[16].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[16].is_active         | 1                                                                            |
                  | data[16].is_autoapprove    | 1                                                                            |
                  | data[16].price             | 50000                                                                        |
                  | data[16].qrcodeenable      | 1                                                                            |
                  | data[16].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[16].reasonform_id     |                                                                              |
                  | data[16].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[16].is_smart_asset    | 1                                                                            |
                  | data[16].asset_type_id     | 1                                                                            |

                  | data[17].name              | AssetTest1                                                                   |
                  | data[17].description       | description1                                                                 |
                  | data[17].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[17].is_active         | 1                                                                            |
                  | data[17].is_autoapprove    | 1                                                                            |
                  | data[17].price             | 50000                                                                        |
                  | data[17].qrcodeenable      | 1                                                                            |
                  | data[17].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[17].reasonform_id     |                                                                              |
                  | data[17].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[17].is_smart_asset    | 1                                                                            |
                  | data[17].asset_type_id     | 1                                                                            |

                  | data[18].name              | AssetTest1                                                                   |
                  | data[18].description       | description1                                                                 |
                  | data[18].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[18].is_active         | 1                                                                            |
                  | data[18].is_autoapprove    | 1                                                                            |
                  | data[18].price             | 50000                                                                        |
                  | data[18].qrcodeenable      | 1                                                                            |
                  | data[18].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[18].reasonform_id     |                                                                              |
                  | data[18].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[18].is_smart_asset    | 1                                                                            |
                  | data[18].asset_type_id     | 1                                                                            |

                  | data[19].name              | AssetTest1                                                                   |
                  | data[19].description       | description1                                                                 |
                  | data[19].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[19].is_active         | 1                                                                            |
                  | data[19].is_autoapprove    | 1                                                                            |
                  | data[19].price             | 50000                                                                        |
                  | data[19].qrcodeenable      | 1                                                                            |
                  | data[19].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[19].reasonform_id     |                                                                              |
                  | data[19].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[19].is_smart_asset    | 1                                                                            |
                  | data[19].asset_type_id     | 1                                                                            |

                  | data[20].name              | AssetTest1                                                                   |
                  | data[20].description       | description1                                                                 |
                  | data[20].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[20].is_active         | 1                                                                            |
                  | data[20].is_autoapprove    | 1                                                                            |
                  | data[20].price             | 50000                                                                        |
                  | data[20].qrcodeenable      | 1                                                                            |
                  | data[20].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[20].reasonform_id     |                                                                              |
                  | data[20].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[20].is_smart_asset    | 1                                                                            |
                  | data[20].asset_type_id     | 1                                                                            |

                  | data[21].name              | AssetTest1                                                                   |
                  | data[21].description       | description1                                                                 |
                  | data[21].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[21].is_active         | 1                                                                            |
                  | data[21].is_autoapprove    | 1                                                                            |
                  | data[21].price             | 50000                                                                        |
                  | data[21].qrcodeenable      | 1                                                                            |
                  | data[21].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[21].reasonform_id     |                                                                              |
                  | data[21].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[21].is_smart_asset    | 1                                                                            |
                  | data[21].asset_type_id     | 1                                                                            |

                  | data[22].name              | AssetTest1                                                                   |
                  | data[22].description       | description1                                                                 |
                  | data[22].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[22].is_active         | 1                                                                            |
                  | data[22].is_autoapprove    | 1                                                                            |
                  | data[22].price             | 50000                                                                        |
                  | data[22].qrcodeenable      | 1                                                                            |
                  | data[22].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[22].reasonform_id     |                                                                              |
                  | data[22].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[22].is_smart_asset    | 1                                                                            |
                  | data[22].asset_type_id     | 1                                                                            |

                  | data[23].name              | AssetTest1                                                                   |
                  | data[23].description       | description1                                                                 |
                  | data[23].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[23].is_active         | 1                                                                            |
                  | data[23].is_autoapprove    | 1                                                                            |
                  | data[23].price             | 50000                                                                        |
                  | data[23].qrcodeenable      | 1                                                                            |
                  | data[23].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[23].reasonform_id     |                                                                              |
                  | data[23].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[23].is_smart_asset    | 1                                                                            |
                  | data[23].asset_type_id     | 1                                                                            |

                  | data[24].name              | AssetTest1                                                                   |
                  | data[24].description       | description1                                                                 |
                  | data[24].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[24].is_active         | 1                                                                            |
                  | data[24].is_autoapprove    | 1                                                                            |
                  | data[24].price             | 50000                                                                        |
                  | data[24].qrcodeenable      | 1                                                                            |
                  | data[24].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[24].reasonform_id     |                                                                              |
                  | data[24].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[24].is_smart_asset    | 1                                                                            |
                  | data[24].asset_type_id     | 1                                                                            |

                  | data[25].name              | AssetTest1                                                                   |
                  | data[25].description       | description1                                                                 |
                  | data[25].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[25].is_active         | 1                                                                            |
                  | data[25].is_autoapprove    | 1                                                                            |
                  | data[25].price             | 50000                                                                        |
                  | data[25].qrcodeenable      | 1                                                                            |
                  | data[25].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[25].reasonform_id     |                                                                              |
                  | data[25].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[25].is_smart_asset    | 1                                                                            |
                  | data[25].asset_type_id     | 1                                                                            |

                  | data[26].name              | AssetTest1                                                                   |
                  | data[26].description       | description1                                                                 |
                  | data[26].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[26].is_active         | 1                                                                            |
                  | data[26].is_autoapprove    | 1                                                                            |
                  | data[26].price             | 50000                                                                        |
                  | data[26].qrcodeenable      | 1                                                                            |
                  | data[26].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[26].reasonform_id     |                                                                              |
                  | data[26].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[26].is_smart_asset    | 1                                                                            |
                  | data[26].asset_type_id     | 1                                                                            |

                  | data[27].name              | AssetTest1                                                                   |
                  | data[27].description       | description1                                                                 |
                  | data[27].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[27].is_active         | 1                                                                            |
                  | data[27].is_autoapprove    | 1                                                                            |
                  | data[27].price             | 50000                                                                        |
                  | data[27].qrcodeenable      | 1                                                                            |
                  | data[27].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[27].reasonform_id     |                                                                              |
                  | data[27].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[27].is_smart_asset    | 1                                                                            |
                  | data[27].asset_type_id     | 1                                                                            |

                  | data[28].name              | AssetTest1                                                                   |
                  | data[28].description       | description1                                                                 |
                  | data[28].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[28].is_active         | 1                                                                            |
                  | data[28].is_autoapprove    | 1                                                                            |
                  | data[28].price             | 50000                                                                        |
                  | data[28].qrcodeenable      | 1                                                                            |
                  | data[28].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[28].reasonform_id     |                                                                              |
                  | data[28].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[28].is_smart_asset    | 1                                                                            |
                  | data[28].asset_type_id     | 1                                                                            |

                  | data[29].name              | AssetTest1                                                                   |
                  | data[29].description       | description1                                                                 |
                  | data[29].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[29].is_active         | 1                                                                            |
                  | data[29].is_autoapprove    | 1                                                                            |
                  | data[29].price             | 50000                                                                        |
                  | data[29].qrcodeenable      | 1                                                                            |
                  | data[29].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[29].reasonform_id     |                                                                              |
                  | data[29].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[29].is_smart_asset    | 1                                                                            |
                  | data[29].asset_type_id     | 1                                                                            |

                  | data[30].name              | AssetTest1                                                                   |
                  | data[30].description       | description1                                                                 |
                  | data[30].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[30].is_active         | 1                                                                            |
                  | data[30].is_autoapprove    | 1                                                                            |
                  | data[30].price             | 50000                                                                        |
                  | data[30].qrcodeenable      | 1                                                                            |
                  | data[30].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[30].reasonform_id     |                                                                              |
                  | data[30].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[30].is_smart_asset    | 1                                                                            |
                  | data[30].asset_type_id     | 1                                                                            |

                  | data[31].name              | AssetTest1                                                                   |
                  | data[31].description       | description1                                                                 |
                  | data[31].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[31].is_active         | 1                                                                            |
                  | data[31].is_autoapprove    | 1                                                                            |
                  | data[31].price             | 50000                                                                        |
                  | data[31].qrcodeenable      | 1                                                                            |
                  | data[31].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[31].reasonform_id     |                                                                              |
                  | data[31].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[31].is_smart_asset    | 1                                                                            |
                  | data[31].asset_type_id     | 1                                                                            |

                  | data[32].name              | AssetTest1                                                                   |
                  | data[32].description       | description1                                                                 |
                  | data[32].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[32].is_active         | 1                                                                            |
                  | data[32].is_autoapprove    | 1                                                                            |
                  | data[32].price             | 50000                                                                        |
                  | data[32].qrcodeenable      | 1                                                                            |
                  | data[32].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[32].reasonform_id     |                                                                              |
                  | data[32].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[32].is_smart_asset    | 1                                                                            |
                  | data[32].asset_type_id     | 1                                                                            |

                  | data[33].name              | AssetTest1                                                                   |
                  | data[33].description       | description1                                                                 |
                  | data[33].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[33].is_active         | 1                                                                            |
                  | data[33].is_autoapprove    | 1                                                                            |
                  | data[33].price             | 50000                                                                        |
                  | data[33].qrcodeenable      | 1                                                                            |
                  | data[33].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[33].reasonform_id     |                                                                              |
                  | data[33].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[33].is_smart_asset    | 1                                                                            |
                  | data[33].asset_type_id     | 1                                                                            |

                  | data[34].name              | AssetTest1                                                                   |
                  | data[34].description       | description1                                                                 |
                  | data[34].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[34].is_active         | 1                                                                            |
                  | data[34].is_autoapprove    | 1                                                                            |
                  | data[34].price             | 50000                                                                        |
                  | data[34].qrcodeenable      | 1                                                                            |
                  | data[34].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[34].reasonform_id     |                                                                              |
                  | data[34].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[34].is_smart_asset    | 1                                                                            |
                  | data[34].asset_type_id     | 1                                                                            |

                  | data[35].name              | AssetTest1                                                                   |
                  | data[35].description       | description1                                                                 |
                  | data[35].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[35].is_active         | 1                                                                            |
                  | data[35].is_autoapprove    | 1                                                                            |
                  | data[35].price             | 50000                                                                        |
                  | data[35].qrcodeenable      | 1                                                                            |
                  | data[35].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[35].reasonform_id     |                                                                              |
                  | data[35].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[35].is_smart_asset    | 1                                                                            |
                  | data[35].asset_type_id     | 1                                                                            |

                  | data[36].name              | AssetTest1                                                                   |
                  | data[36].description       | description1                                                                 |
                  | data[36].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[36].is_active         | 1                                                                            |
                  | data[36].is_autoapprove    | 1                                                                            |
                  | data[36].price             | 50000                                                                        |
                  | data[36].qrcodeenable      | 1                                                                            |
                  | data[36].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[36].reasonform_id     |                                                                              |
                  | data[36].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[36].is_smart_asset    | 1                                                                            |
                  | data[36].asset_type_id     | 1                                                                            |

                  | data[37].name              | AssetTest1                                                                   |
                  | data[37].description       | description1                                                                 |
                  | data[37].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[37].is_active         | 1                                                                            |
                  | data[37].is_autoapprove    | 1                                                                            |
                  | data[37].price             | 50000                                                                        |
                  | data[37].qrcodeenable      | 1                                                                            |
                  | data[37].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[37].reasonform_id     |                                                                              |
                  | data[37].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[37].is_smart_asset    | 1                                                                            |
                  | data[37].asset_type_id     | 1                                                                            |

                  | data[38].name              | AssetTest1                                                                   |
                  | data[38].description       | description1                                                                 |
                  | data[38].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[38].is_active         | 1                                                                            |
                  | data[38].is_autoapprove    | 1                                                                            |
                  | data[38].price             | 50000                                                                        |
                  | data[38].qrcodeenable      | 1                                                                            |
                  | data[38].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[38].reasonform_id     |                                                                              |
                  | data[38].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[38].is_smart_asset    | 1                                                                            |
                  | data[38].asset_type_id     | 1                                                                            |

                  | data[39].name              | AssetTest1                                                                   |
                  | data[39].description       | description1                                                                 |
                  | data[39].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[39].is_active         | 1                                                                            |
                  | data[39].is_autoapprove    | 1                                                                            |
                  | data[39].price             | 50000                                                                        |
                  | data[39].qrcodeenable      | 1                                                                            |
                  | data[39].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[39].reasonform_id     |                                                                              |
                  | data[39].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[39].is_smart_asset    | 1                                                                            |
                  | data[39].asset_type_id     | 1                                                                            |

                  | data[40].name              | AssetTest1                                                                   |
                  | data[40].description       | description1                                                                 |
                  | data[40].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[40].is_active         | 1                                                                            |
                  | data[40].is_autoapprove    | 1                                                                            |
                  | data[40].price             | 50000                                                                        |
                  | data[40].qrcodeenable      | 1                                                                            |
                  | data[40].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[40].reasonform_id     |                                                                              |
                  | data[40].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[40].is_smart_asset    | 1                                                                            |
                  | data[40].asset_type_id     | 1                                                                            |

                  | data[41].name              | AssetTest1                                                                   |
                  | data[41].description       | description1                                                                 |
                  | data[41].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[41].is_active         | 1                                                                            |
                  | data[41].is_autoapprove    | 1                                                                            |
                  | data[41].price             | 50000                                                                        |
                  | data[41].qrcodeenable      | 1                                                                            |
                  | data[41].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[41].reasonform_id     |                                                                              |
                  | data[41].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[41].is_smart_asset    | 1                                                                            |
                  | data[41].asset_type_id     | 1                                                                            |

                  | data[42].name              | AssetTest1                                                                   |
                  | data[42].description       | description1                                                                 |
                  | data[42].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[42].is_active         | 1                                                                            |
                  | data[42].is_autoapprove    | 1                                                                            |
                  | data[42].price             | 50000                                                                        |
                  | data[42].qrcodeenable      | 1                                                                            |
                  | data[42].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[42].reasonform_id     |                                                                              |
                  | data[42].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[42].is_smart_asset    | 1                                                                            |
                  | data[42].asset_type_id     | 1                                                                            |

                  | data[43].name              | AssetTest1                                                                   |
                  | data[43].description       | description1                                                                 |
                  | data[43].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[43].is_active         | 1                                                                            |
                  | data[43].is_autoapprove    | 1                                                                            |
                  | data[43].price             | 50000                                                                        |
                  | data[43].qrcodeenable      | 1                                                                            |
                  | data[43].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[43].reasonform_id     |                                                                              |
                  | data[43].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[43].is_smart_asset    | 1                                                                            |
                  | data[43].asset_type_id     | 1                                                                            |

                  | data[44].name              | AssetTest1                                                                   |
                  | data[44].description       | description1                                                                 |
                  | data[44].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[44].is_active         | 1                                                                            |
                  | data[44].is_autoapprove    | 1                                                                            |
                  | data[44].price             | 50000                                                                        |
                  | data[44].qrcodeenable      | 1                                                                            |
                  | data[44].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[44].reasonform_id     |                                                                              |
                  | data[44].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[44].is_smart_asset    | 1                                                                            |
                  | data[44].asset_type_id     | 1                                                                            |

                  | data[45].name              | AssetTest1                                                                   |
                  | data[45].description       | description1                                                                 |
                  | data[45].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[45].is_active         | 1                                                                            |
                  | data[45].is_autoapprove    | 1                                                                            |
                  | data[45].price             | 50000                                                                        |
                  | data[45].qrcodeenable      | 1                                                                            |
                  | data[45].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[45].reasonform_id     |                                                                              |
                  | data[45].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[45].is_smart_asset    | 1                                                                            |
                  | data[45].asset_type_id     | 1                                                                            |

                  | data[46].name              | AssetTest1                                                                   |
                  | data[46].description       | description1                                                                 |
                  | data[46].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[46].is_active         | 1                                                                            |
                  | data[46].is_autoapprove    | 1                                                                            |
                  | data[46].price             | 50000                                                                        |
                  | data[46].qrcodeenable      | 1                                                                            |
                  | data[46].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[46].reasonform_id     |                                                                              |
                  | data[46].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[46].is_smart_asset    | 1                                                                            |
                  | data[46].asset_type_id     | 1                                                                            |

                  | data[47].name              | AssetTest1                                                                   |
                  | data[47].description       | description1                                                                 |
                  | data[47].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[47].is_active         | 1                                                                            |
                  | data[47].is_autoapprove    | 1                                                                            |
                  | data[47].price             | 50000                                                                        |
                  | data[47].qrcodeenable      | 1                                                                            |
                  | data[47].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[47].reasonform_id     |                                                                              |
                  | data[47].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[47].is_smart_asset    | 1                                                                            |
                  | data[47].asset_type_id     | 1                                                                            |

                  | data[48].name              | AssetTest1                                                                   |
                  | data[48].description       | description1                                                                 |
                  | data[48].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[48].is_active         | 1                                                                            |
                  | data[48].is_autoapprove    | 1                                                                            |
                  | data[48].price             | 50000                                                                        |
                  | data[48].qrcodeenable      | 1                                                                            |
                  | data[48].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[48].reasonform_id     |                                                                              |
                  | data[48].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[48].is_smart_asset    | 1                                                                            |
                  | data[48].asset_type_id     | 1                                                                            |

                  | data[49].name              | AssetTest1                                                                   |
                  | data[49].description       | description1                                                                 |
                  | data[49].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[49].is_active         | 1                                                                            |
                  | data[49].is_autoapprove    | 1                                                                            |
                  | data[49].price             | 50000                                                                        |
                  | data[49].qrcodeenable      | 1                                                                            |
                  | data[49].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[49].reasonform_id     |                                                                              |
                  | data[49].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[49].is_smart_asset    | 1                                                                            |
                  | data[49].asset_type_id     | 1                                                                            |

                  | data[50].name              | AssetTest1                                                                   |
                  | data[50].description       | description1                                                                 |
                  | data[50].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[50].is_active         | 1                                                                            |
                  | data[50].is_autoapprove    | 1                                                                            |
                  | data[50].price             | 50000                                                                        |
                  | data[50].qrcodeenable      | 1                                                                            |
                  | data[50].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[50].reasonform_id     |                                                                              |
                  | data[50].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[50].is_smart_asset    | 1                                                                            |
                  | data[50].asset_type_id     | 1                                                                            |

                  | data[51].name              | AssetTest1                                                                   |
                  | data[51].description       | description1                                                                 |
                  | data[51].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[51].is_active         | 1                                                                            |
                  | data[51].is_autoapprove    | 1                                                                            |
                  | data[51].price             | 50000                                                                        |
                  | data[51].qrcodeenable      | 1                                                                            |
                  | data[51].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[51].reasonform_id     |                                                                              |
                  | data[51].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[51].is_smart_asset    | 1                                                                            |
                  | data[51].asset_type_id     | 1                                                                            |

                  | data[52].name              | AssetTest1                                                                   |
                  | data[52].description       | description1                                                                 |
                  | data[52].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[52].is_active         | 1                                                                            |
                  | data[52].is_autoapprove    | 1                                                                            |
                  | data[52].price             | 50000                                                                        |
                  | data[52].qrcodeenable      | 1                                                                            |
                  | data[52].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[52].reasonform_id     |                                                                              |
                  | data[52].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[52].is_smart_asset    | 1                                                                            |
                  | data[52].asset_type_id     | 1                                                                            |

                  | data[53].name              | AssetTest1                                                                   |
                  | data[53].description       | description1                                                                 |
                  | data[53].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[53].is_active         | 1                                                                            |
                  | data[53].is_autoapprove    | 1                                                                            |
                  | data[53].price             | 50000                                                                        |
                  | data[53].qrcodeenable      | 1                                                                            |
                  | data[53].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[53].reasonform_id     |                                                                              |
                  | data[53].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[53].is_smart_asset    | 1                                                                            |
                  | data[53].asset_type_id     | 1                                                                            |

                  | data[54].name              | AssetTest1                                                                   |
                  | data[54].description       | description1                                                                 |
                  | data[54].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[54].is_active         | 1                                                                            |
                  | data[54].is_autoapprove    | 1                                                                            |
                  | data[54].price             | 50000                                                                        |
                  | data[54].qrcodeenable      | 1                                                                            |
                  | data[54].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[54].reasonform_id     |                                                                              |
                  | data[54].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[54].is_smart_asset    | 1                                                                            |
                  | data[54].asset_type_id     | 1                                                                            |

                  | data[55].name              | AssetTest1                                                                   |
                  | data[55].description       | description1                                                                 |
                  | data[55].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[55].is_active         | 1                                                                            |
                  | data[55].is_autoapprove    | 1                                                                            |
                  | data[55].price             | 50000                                                                        |
                  | data[55].qrcodeenable      | 1                                                                            |
                  | data[55].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[55].reasonform_id     |                                                                              |
                  | data[55].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[55].is_smart_asset    | 1                                                                            |
                  | data[55].asset_type_id     | 1                                                                            |

                  | data[56].name              | AssetTest1                                                                   |
                  | data[56].description       | description1                                                                 |
                  | data[56].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[56].is_active         | 1                                                                            |
                  | data[56].is_autoapprove    | 1                                                                            |
                  | data[56].price             | 50000                                                                        |
                  | data[56].qrcodeenable      | 1                                                                            |
                  | data[56].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[56].reasonform_id     |                                                                              |
                  | data[56].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[56].is_smart_asset    | 1                                                                            |
                  | data[56].asset_type_id     | 1                                                                            |

                  | data[57].name              | AssetTest1                                                                   |
                  | data[57].description       | description1                                                                 |
                  | data[57].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[57].is_active         | 1                                                                            |
                  | data[57].is_autoapprove    | 1                                                                            |
                  | data[57].price             | 50000                                                                        |
                  | data[57].qrcodeenable      | 1                                                                            |
                  | data[57].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[57].reasonform_id     |                                                                              |
                  | data[57].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[57].is_smart_asset    | 1                                                                            |
                  | data[57].asset_type_id     | 1                                                                            |

                  | data[58].name              | AssetTest1                                                                   |
                  | data[58].description       | description1                                                                 |
                  | data[58].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[58].is_active         | 1                                                                            |
                  | data[58].is_autoapprove    | 1                                                                            |
                  | data[58].price             | 50000                                                                        |
                  | data[58].qrcodeenable      | 1                                                                            |
                  | data[58].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[58].reasonform_id     |                                                                              |
                  | data[58].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[58].is_smart_asset    | 1                                                                            |
                  | data[58].asset_type_id     | 1                                                                            |

                  | data[59].name              | AssetTest1                                                                   |
                  | data[59].description       | description1                                                                 |
                  | data[59].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[59].is_active         | 1                                                                            |
                  | data[59].is_autoapprove    | 1                                                                            |
                  | data[59].price             | 50000                                                                        |
                  | data[59].qrcodeenable      | 1                                                                            |
                  | data[59].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[59].reasonform_id     |                                                                              |
                  | data[59].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[59].is_smart_asset    | 1                                                                            |
                  | data[59].asset_type_id     | 1                                                                            |

                  | data[60].name              | AssetTest1                                                                   |
                  | data[60].description       | description1                                                                 |
                  | data[60].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[60].is_active         | 1                                                                            |
                  | data[60].is_autoapprove    | 1                                                                            |
                  | data[60].price             | 50000                                                                        |
                  | data[60].qrcodeenable      | 1                                                                            |
                  | data[60].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[60].reasonform_id     |                                                                              |
                  | data[60].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[60].is_smart_asset    | 1                                                                            |
                  | data[60].asset_type_id     | 1                                                                            |

                  | data[61].name              | AssetTest1                                                                   |
                  | data[61].description       | description1                                                                 |
                  | data[61].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[61].is_active         | 1                                                                            |
                  | data[61].is_autoapprove    | 1                                                                            |
                  | data[61].price             | 50000                                                                        |
                  | data[61].qrcodeenable      | 1                                                                            |
                  | data[61].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[61].reasonform_id     |                                                                              |
                  | data[61].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[61].is_smart_asset    | 1                                                                            |
                  | data[61].asset_type_id     | 1                                                                            |

                  | data[62].name              | AssetTest1                                                                   |
                  | data[62].description       | description1                                                                 |
                  | data[62].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[62].is_active         | 1                                                                            |
                  | data[62].is_autoapprove    | 1                                                                            |
                  | data[62].price             | 50000                                                                        |
                  | data[62].qrcodeenable      | 1                                                                            |
                  | data[62].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[62].reasonform_id     |                                                                              |
                  | data[62].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[62].is_smart_asset    | 1                                                                            |
                  | data[62].asset_type_id     | 1                                                                            |

                  | data[63].name              | AssetTest1                                                                   |
                  | data[63].description       | description1                                                                 |
                  | data[63].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[63].is_active         | 1                                                                            |
                  | data[63].is_autoapprove    | 1                                                                            |
                  | data[63].price             | 50000                                                                        |
                  | data[63].qrcodeenable      | 1                                                                            |
                  | data[63].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[63].reasonform_id     |                                                                              |
                  | data[63].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[63].is_smart_asset    | 1                                                                            |
                  | data[63].asset_type_id     | 1                                                                            |

                  | data[64].name              | AssetTest1                                                                   |
                  | data[64].description       | description1                                                                 |
                  | data[64].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[64].is_active         | 1                                                                            |
                  | data[64].is_autoapprove    | 1                                                                            |
                  | data[64].price             | 50000                                                                        |
                  | data[64].qrcodeenable      | 1                                                                            |
                  | data[64].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[64].reasonform_id     |                                                                              |
                  | data[64].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[64].is_smart_asset    | 1                                                                            |
                  | data[64].asset_type_id     | 1                                                                            |

                  | data[65].name              | AssetTest1                                                                   |
                  | data[65].description       | description1                                                                 |
                  | data[65].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[65].is_active         | 1                                                                            |
                  | data[65].is_autoapprove    | 1                                                                            |
                  | data[65].price             | 50000                                                                        |
                  | data[65].qrcodeenable      | 1                                                                            |
                  | data[65].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[65].reasonform_id     |                                                                              |
                  | data[65].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[65].is_smart_asset    | 1                                                                            |
                  | data[65].asset_type_id     | 1                                                                            |

                  | data[66].name              | AssetTest1                                                                   |
                  | data[66].description       | description1                                                                 |
                  | data[66].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[66].is_active         | 1                                                                            |
                  | data[66].is_autoapprove    | 1                                                                            |
                  | data[66].price             | 50000                                                                        |
                  | data[66].qrcodeenable      | 1                                                                            |
                  | data[66].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[66].reasonform_id     |                                                                              |
                  | data[66].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[66].is_smart_asset    | 1                                                                            |
                  | data[66].asset_type_id     | 1                                                                            |

                  | data[67].name              | AssetTest1                                                                   |
                  | data[67].description       | description1                                                                 |
                  | data[67].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[67].is_active         | 1                                                                            |
                  | data[67].is_autoapprove    | 1                                                                            |
                  | data[67].price             | 50000                                                                        |
                  | data[67].qrcodeenable      | 1                                                                            |
                  | data[67].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[67].reasonform_id     |                                                                              |
                  | data[67].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[67].is_smart_asset    | 1                                                                            |
                  | data[67].asset_type_id     | 1                                                                            |

                  | data[68].name              | AssetTest1                                                                   |
                  | data[68].description       | description1                                                                 |
                  | data[68].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[68].is_active         | 1                                                                            |
                  | data[68].is_autoapprove    | 1                                                                            |
                  | data[68].price             | 50000                                                                        |
                  | data[68].qrcodeenable      | 1                                                                            |
                  | data[68].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[68].reasonform_id     |                                                                              |
                  | data[68].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[68].is_smart_asset    | 1                                                                            |
                  | data[68].asset_type_id     | 1                                                                            |

                  | data[69].name              | AssetTest1                                                                   |
                  | data[69].description       | description1                                                                 |
                  | data[69].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[69].is_active         | 1                                                                            |
                  | data[69].is_autoapprove    | 1                                                                            |
                  | data[69].price             | 50000                                                                        |
                  | data[69].qrcodeenable      | 1                                                                            |
                  | data[69].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[69].reasonform_id     |                                                                              |
                  | data[69].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[69].is_smart_asset    | 1                                                                            |
                  | data[69].asset_type_id     | 1                                                                            |

                  | data[70].name              | AssetTest1                                                                   |
                  | data[70].description       | description1                                                                 |
                  | data[70].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[70].is_active         | 1                                                                            |
                  | data[70].is_autoapprove    | 1                                                                            |
                  | data[70].price             | 50000                                                                        |
                  | data[70].qrcodeenable      | 1                                                                            |
                  | data[70].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[70].reasonform_id     |                                                                              |
                  | data[70].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[70].is_smart_asset    | 1                                                                            |
                  | data[70].asset_type_id     | 1                                                                            |

                  | data[71].name              | AssetTest1                                                                   |
                  | data[71].description       | description1                                                                 |
                  | data[71].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[71].is_active         | 1                                                                            |
                  | data[71].is_autoapprove    | 1                                                                            |
                  | data[71].price             | 50000                                                                        |
                  | data[71].qrcodeenable      | 1                                                                            |
                  | data[71].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[71].reasonform_id     |                                                                              |
                  | data[71].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[71].is_smart_asset    | 1                                                                            |
                  | data[71].asset_type_id     | 1                                                                            |

                  | data[72].name              | AssetTest1                                                                   |
                  | data[72].description       | description1                                                                 |
                  | data[72].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[72].is_active         | 1                                                                            |
                  | data[72].is_autoapprove    | 1                                                                            |
                  | data[72].price             | 50000                                                                        |
                  | data[72].qrcodeenable      | 1                                                                            |
                  | data[72].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[72].reasonform_id     |                                                                              |
                  | data[72].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[72].is_smart_asset    | 1                                                                            |
                  | data[72].asset_type_id     | 1                                                                            |

                  | data[73].name              | AssetTest1                                                                   |
                  | data[73].description       | description1                                                                 |
                  | data[73].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[73].is_active         | 1                                                                            |
                  | data[73].is_autoapprove    | 1                                                                            |
                  | data[73].price             | 50000                                                                        |
                  | data[73].qrcodeenable      | 1                                                                            |
                  | data[73].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[73].reasonform_id     |                                                                              |
                  | data[73].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[73].is_smart_asset    | 1                                                                            |
                  | data[73].asset_type_id     | 1                                                                            |

                  | data[74].name              | AssetTest1                                                                   |
                  | data[74].description       | description1                                                                 |
                  | data[74].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[74].is_active         | 1                                                                            |
                  | data[74].is_autoapprove    | 1                                                                            |
                  | data[74].price             | 50000                                                                        |
                  | data[74].qrcodeenable      | 1                                                                            |
                  | data[74].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[74].reasonform_id     |                                                                              |
                  | data[74].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[74].is_smart_asset    | 1                                                                            |
                  | data[74].asset_type_id     | 1                                                                            |

                  | data[75].name              | AssetTest1                                                                   |
                  | data[75].description       | description1                                                                 |
                  | data[75].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[75].is_active         | 1                                                                            |
                  | data[75].is_autoapprove    | 1                                                                            |
                  | data[75].price             | 50000                                                                        |
                  | data[75].qrcodeenable      | 1                                                                            |
                  | data[75].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[75].reasonform_id     |                                                                              |
                  | data[75].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[75].is_smart_asset    | 1                                                                            |
                  | data[75].asset_type_id     | 1                                                                            |

                  | data[76].name              | AssetTest1                                                                   |
                  | data[76].description       | description1                                                                 |
                  | data[76].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[76].is_active         | 1                                                                            |
                  | data[76].is_autoapprove    | 1                                                                            |
                  | data[76].price             | 50000                                                                        |
                  | data[76].qrcodeenable      | 1                                                                            |
                  | data[76].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[76].reasonform_id     |                                                                              |
                  | data[76].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[76].is_smart_asset    | 1                                                                            |
                  | data[76].asset_type_id     | 1                                                                            |

                  | data[77].name              | AssetTest1                                                                   |
                  | data[77].description       | description1                                                                 |
                  | data[77].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[77].is_active         | 1                                                                            |
                  | data[77].is_autoapprove    | 1                                                                            |
                  | data[77].price             | 50000                                                                        |
                  | data[77].qrcodeenable      | 1                                                                            |
                  | data[77].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[77].reasonform_id     |                                                                              |
                  | data[77].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[77].is_smart_asset    | 1                                                                            |
                  | data[77].asset_type_id     | 1                                                                            |

                  | data[78].name              | AssetTest1                                                                   |
                  | data[78].description       | description1                                                                 |
                  | data[78].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[78].is_active         | 1                                                                            |
                  | data[78].is_autoapprove    | 1                                                                            |
                  | data[78].price             | 50000                                                                        |
                  | data[78].qrcodeenable      | 1                                                                            |
                  | data[78].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[78].reasonform_id     |                                                                              |
                  | data[78].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[78].is_smart_asset    | 1                                                                            |
                  | data[78].asset_type_id     | 1                                                                            |

                  | data[79].name              | AssetTest1                                                                   |
                  | data[79].description       | description1                                                                 |
                  | data[79].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[79].is_active         | 1                                                                            |
                  | data[79].is_autoapprove    | 1                                                                            |
                  | data[79].price             | 50000                                                                        |
                  | data[79].qrcodeenable      | 1                                                                            |
                  | data[79].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[79].reasonform_id     |                                                                              |
                  | data[79].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[79].is_smart_asset    | 1                                                                            |
                  | data[79].asset_type_id     | 1                                                                            |

                  | data[80].name              | AssetTest1                                                                   |
                  | data[80].description       | description1                                                                 |
                  | data[80].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[80].is_active         | 1                                                                            |
                  | data[80].is_autoapprove    | 1                                                                            |
                  | data[80].price             | 50000                                                                        |
                  | data[80].qrcodeenable      | 1                                                                            |
                  | data[80].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[80].reasonform_id     |                                                                              |
                  | data[80].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[80].is_smart_asset    | 1                                                                            |
                  | data[80].asset_type_id     | 1                                                                            |

                  | data[81].name              | AssetTest1                                                                   |
                  | data[81].description       | description1                                                                 |
                  | data[81].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[81].is_active         | 1                                                                            |
                  | data[81].is_autoapprove    | 1                                                                            |
                  | data[81].price             | 50000                                                                        |
                  | data[81].qrcodeenable      | 1                                                                            |
                  | data[81].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[81].reasonform_id     |                                                                              |
                  | data[81].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[81].is_smart_asset    | 1                                                                            |
                  | data[81].asset_type_id     | 1                                                                            |

                  | data[82].name              | AssetTest1                                                                   |
                  | data[82].description       | description1                                                                 |
                  | data[82].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[82].is_active         | 1                                                                            |
                  | data[82].is_autoapprove    | 1                                                                            |
                  | data[82].price             | 50000                                                                        |
                  | data[82].qrcodeenable      | 1                                                                            |
                  | data[82].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[82].reasonform_id     |                                                                              |
                  | data[82].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[82].is_smart_asset    | 1                                                                            |
                  | data[82].asset_type_id     | 1                                                                            |

                  | data[83].name              | AssetTest1                                                                   |
                  | data[83].description       | description1                                                                 |
                  | data[83].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[83].is_active         | 1                                                                            |
                  | data[83].is_autoapprove    | 1                                                                            |
                  | data[83].price             | 50000                                                                        |
                  | data[83].qrcodeenable      | 1                                                                            |
                  | data[83].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[83].reasonform_id     |                                                                              |
                  | data[83].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[83].is_smart_asset    | 1                                                                            |
                  | data[83].asset_type_id     | 1                                                                            |

                  | data[84].name              | AssetTest1                                                                   |
                  | data[84].description       | description1                                                                 |
                  | data[84].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[84].is_active         | 1                                                                            |
                  | data[84].is_autoapprove    | 1                                                                            |
                  | data[84].price             | 50000                                                                        |
                  | data[84].qrcodeenable      | 1                                                                            |
                  | data[84].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[84].reasonform_id     |                                                                              |
                  | data[84].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[84].is_smart_asset    | 1                                                                            |
                  | data[84].asset_type_id     | 1                                                                            |

                  | data[85].name              | AssetTest1                                                                   |
                  | data[85].description       | description1                                                                 |
                  | data[85].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[85].is_active         | 1                                                                            |
                  | data[85].is_autoapprove    | 1                                                                            |
                  | data[85].price             | 50000                                                                        |
                  | data[85].qrcodeenable      | 1                                                                            |
                  | data[85].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[85].reasonform_id     |                                                                              |
                  | data[85].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[85].is_smart_asset    | 1                                                                            |
                  | data[85].asset_type_id     | 1                                                                            |

                  | data[86].name              | AssetTest1                                                                   |
                  | data[86].description       | description1                                                                 |
                  | data[86].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[86].is_active         | 1                                                                            |
                  | data[86].is_autoapprove    | 1                                                                            |
                  | data[86].price             | 50000                                                                        |
                  | data[86].qrcodeenable      | 1                                                                            |
                  | data[86].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[86].reasonform_id     |                                                                              |
                  | data[86].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[86].is_smart_asset    | 1                                                                            |
                  | data[86].asset_type_id     | 1                                                                            |

                  | data[87].name              | AssetTest1                                                                   |
                  | data[87].description       | description1                                                                 |
                  | data[87].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[87].is_active         | 1                                                                            |
                  | data[87].is_autoapprove    | 1                                                                            |
                  | data[87].price             | 50000                                                                        |
                  | data[87].qrcodeenable      | 1                                                                            |
                  | data[87].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[87].reasonform_id     |                                                                              |
                  | data[87].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[87].is_smart_asset    | 1                                                                            |
                  | data[87].asset_type_id     | 1                                                                            |

                  | data[88].name              | AssetTest1                                                                   |
                  | data[88].description       | description1                                                                 |
                  | data[88].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[88].is_active         | 1                                                                            |
                  | data[88].is_autoapprove    | 1                                                                            |
                  | data[88].price             | 50000                                                                        |
                  | data[88].qrcodeenable      | 1                                                                            |
                  | data[88].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[88].reasonform_id     |                                                                              |
                  | data[88].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[88].is_smart_asset    | 1                                                                            |
                  | data[88].asset_type_id     | 1                                                                            |

                  | data[89].name              | AssetTest1                                                                   |
                  | data[89].description       | description1                                                                 |
                  | data[89].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[89].is_active         | 1                                                                            |
                  | data[89].is_autoapprove    | 1                                                                            |
                  | data[89].price             | 50000                                                                        |
                  | data[89].qrcodeenable      | 1                                                                            |
                  | data[89].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[89].reasonform_id     |                                                                              |
                  | data[89].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[89].is_smart_asset    | 1                                                                            |
                  | data[89].asset_type_id     | 1                                                                            |

                  | data[90].name              | AssetTest1                                                                   |
                  | data[90].description       | description1                                                                 |
                  | data[90].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[90].is_active         | 1                                                                            |
                  | data[90].is_autoapprove    | 1                                                                            |
                  | data[90].price             | 50000                                                                        |
                  | data[90].qrcodeenable      | 1                                                                            |
                  | data[90].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[90].reasonform_id     |                                                                              |
                  | data[90].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[90].is_smart_asset    | 1                                                                            |
                  | data[90].asset_type_id     | 1                                                                            |

                  | data[91].name              | AssetTest1                                                                   |
                  | data[91].description       | description1                                                                 |
                  | data[91].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[91].is_active         | 1                                                                            |
                  | data[91].is_autoapprove    | 1                                                                            |
                  | data[91].price             | 50000                                                                        |
                  | data[91].qrcodeenable      | 1                                                                            |
                  | data[91].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[91].reasonform_id     |                                                                              |
                  | data[91].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[91].is_smart_asset    | 1                                                                            |
                  | data[91].asset_type_id     | 1                                                                            |

                  | data[92].name              | AssetTest1                                                                   |
                  | data[92].description       | description1                                                                 |
                  | data[92].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[92].is_active         | 1                                                                            |
                  | data[92].is_autoapprove    | 1                                                                            |
                  | data[92].price             | 50000                                                                        |
                  | data[92].qrcodeenable      | 1                                                                            |
                  | data[92].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[92].reasonform_id     |                                                                              |
                  | data[92].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[92].is_smart_asset    | 1                                                                            |
                  | data[92].asset_type_id     | 1                                                                            |

                  | data[93].name              | AssetTest1                                                                   |
                  | data[93].description       | description1                                                                 |
                  | data[93].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[93].is_active         | 1                                                                            |
                  | data[93].is_autoapprove    | 1                                                                            |
                  | data[93].price             | 50000                                                                        |
                  | data[93].qrcodeenable      | 1                                                                            |
                  | data[93].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[93].reasonform_id     |                                                                              |
                  | data[93].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[93].is_smart_asset    | 1                                                                            |
                  | data[93].asset_type_id     | 1                                                                            |

                  | data[94].name              | AssetTest1                                                                   |
                  | data[94].description       | description1                                                                 |
                  | data[94].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[94].is_active         | 1                                                                            |
                  | data[94].is_autoapprove    | 1                                                                            |
                  | data[94].price             | 50000                                                                        |
                  | data[94].qrcodeenable      | 1                                                                            |
                  | data[94].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[94].reasonform_id     |                                                                              |
                  | data[94].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[94].is_smart_asset    | 1                                                                            |
                  | data[94].asset_type_id     | 1                                                                            |

                  | data[95].name              | AssetTest1                                                                   |
                  | data[95].description       | description1                                                                 |
                  | data[95].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[95].is_active         | 1                                                                            |
                  | data[95].is_autoapprove    | 1                                                                            |
                  | data[95].price             | 50000                                                                        |
                  | data[95].qrcodeenable      | 1                                                                            |
                  | data[95].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[95].reasonform_id     |                                                                              |
                  | data[95].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[95].is_smart_asset    | 1                                                                            |
                  | data[95].asset_type_id     | 1                                                                            |

                  | data[96].name              | AssetTest1                                                                   |
                  | data[96].description       | description1                                                                 |
                  | data[96].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[96].is_active         | 1                                                                            |
                  | data[96].is_autoapprove    | 1                                                                            |
                  | data[96].price             | 50000                                                                        |
                  | data[96].qrcodeenable      | 1                                                                            |
                  | data[96].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[96].reasonform_id     |                                                                              |
                  | data[96].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[96].is_smart_asset    | 1                                                                            |
                  | data[96].asset_type_id     | 1                                                                            |

                  | data[97].name              | AssetTest1                                                                   |
                  | data[97].description       | description1                                                                 |
                  | data[97].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[97].is_active         | 1                                                                            |
                  | data[97].is_autoapprove    | 1                                                                            |
                  | data[97].price             | 50000                                                                        |
                  | data[97].qrcodeenable      | 1                                                                            |
                  | data[97].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[97].reasonform_id     |                                                                              |
                  | data[97].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[97].is_smart_asset    | 1                                                                            |
                  | data[97].asset_type_id     | 1                                                                            |

                  | data[98].name              | AssetTest1                                                                   |
                  | data[98].description       | description1                                                                 |
                  | data[98].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[98].is_active         | 1                                                                            |
                  | data[98].is_autoapprove    | 1                                                                            |
                  | data[98].price             | 50000                                                                        |
                  | data[98].qrcodeenable      | 1                                                                            |
                  | data[98].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[98].reasonform_id     |                                                                              |
                  | data[98].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[98].is_smart_asset    | 1                                                                            |
                  | data[98].asset_type_id     | 1                                                                            |

                  | data[99].name              | AssetTest1                                                                   |
                  | data[99].description       | description1                                                                 |
                  | data[99].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[99].is_active         | 1                                                                            |
                  | data[99].is_autoapprove    | 1                                                                            |
                  | data[99].price             | 50000                                                                        |
                  | data[99].qrcodeenable      | 1                                                                            |
                  | data[99].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[99].reasonform_id     |                                                                              |
                  | data[99].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[99].is_smart_asset    | 1                                                                            |
                  | data[99].asset_type_id     | 1                                                                            |

                  | data[100].name              | AssetTest1                                                                   |
                  | data[100].description       | description1                                                                 |
                  | data[100].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[100].is_active         | 1                                                                            |
                  | data[100].is_autoapprove    | 1                                                                            |
                  | data[100].price             | 50000                                                                        |
                  | data[100].qrcodeenable      | 1                                                                            |
                  | data[100].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[100].reasonform_id     |                                                                              |
                  | data[100].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[100].is_smart_asset    | 1                                                                            |
                  | data[100].asset_type_id     | 1                                                                            |

                  | data[101].name              | AssetTest1                                                                   |
                  | data[101].description       | description1                                                                 |
                  | data[101].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[101].is_active         | 1                                                                            |
                  | data[101].is_autoapprove    | 1                                                                            |
                  | data[101].price             | 50000                                                                        |
                  | data[101].qrcodeenable      | 1                                                                            |
                  | data[101].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[101].reasonform_id     |                                                                              |
                  | data[101].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[101].is_smart_asset    | 1                                                                            |
                  | data[101].asset_type_id     | 1                                                                            |

                  | data[102].name              | AssetTest1                                                                   |
                  | data[102].description       | description1                                                                 |
                  | data[102].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[102].is_active         | 1                                                                            |
                  | data[102].is_autoapprove    | 1                                                                            |
                  | data[102].price             | 50000                                                                        |
                  | data[102].qrcodeenable      | 1                                                                            |
                  | data[102].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[102].reasonform_id     |                                                                              |
                  | data[102].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[102].is_smart_asset    | 1                                                                            |
                  | data[102].asset_type_id     | 1                                                                            |

                  | data[103].name              | AssetTest1                                                                   |
                  | data[103].description       | description1                                                                 |
                  | data[103].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[103].is_active         | 1                                                                            |
                  | data[103].is_autoapprove    | 1                                                                            |
                  | data[103].price             | 50000                                                                        |
                  | data[103].qrcodeenable      | 1                                                                            |
                  | data[103].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[103].reasonform_id     |                                                                              |
                  | data[103].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[103].is_smart_asset    | 1                                                                            |
                  | data[103].asset_type_id     | 1                                                                            |

                  | data[104].name              | AssetTest1                                                                   |
                  | data[104].description       | description1                                                                 |
                  | data[104].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[104].is_active         | 1                                                                            |
                  | data[104].is_autoapprove    | 1                                                                            |
                  | data[104].price             | 50000                                                                        |
                  | data[104].qrcodeenable      | 1                                                                            |
                  | data[104].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[104].reasonform_id     |                                                                              |
                  | data[104].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[104].is_smart_asset    | 1                                                                            |
                  | data[104].asset_type_id     | 1                                                                            |

                  | data[105].name              | AssetTest1                                                                   |
                  | data[105].description       | description1                                                                 |
                  | data[105].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[105].is_active         | 1                                                                            |
                  | data[105].is_autoapprove    | 1                                                                            |
                  | data[105].price             | 50000                                                                        |
                  | data[105].qrcodeenable      | 1                                                                            |
                  | data[105].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[105].reasonform_id     |                                                                              |
                  | data[105].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[105].is_smart_asset    | 1                                                                            |
                  | data[105].asset_type_id     | 1                                                                            |

                  | data[106].name              | AssetTest1                                                                   |
                  | data[106].description       | description1                                                                 |
                  | data[106].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[106].is_active         | 1                                                                            |
                  | data[106].is_autoapprove    | 1                                                                            |
                  | data[106].price             | 50000                                                                        |
                  | data[106].qrcodeenable      | 1                                                                            |
                  | data[106].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[106].reasonform_id     |                                                                              |
                  | data[106].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[106].is_smart_asset    | 1                                                                            |
                  | data[106].asset_type_id     | 1                                                                            |

                  | data[107].name              | AssetTest1                                                                   |
                  | data[107].description       | description1                                                                 |
                  | data[107].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[107].is_active         | 1                                                                            |
                  | data[107].is_autoapprove    | 1                                                                            |
                  | data[107].price             | 50000                                                                        |
                  | data[107].qrcodeenable      | 1                                                                            |
                  | data[107].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[107].reasonform_id     |                                                                              |
                  | data[107].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[107].is_smart_asset    | 1                                                                            |
                  | data[107].asset_type_id     | 1                                                                            |

                  | data[108].name              | AssetTest1                                                                   |
                  | data[108].description       | description1                                                                 |
                  | data[108].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[108].is_active         | 1                                                                            |
                  | data[108].is_autoapprove    | 1                                                                            |
                  | data[108].price             | 50000                                                                        |
                  | data[108].qrcodeenable      | 1                                                                            |
                  | data[108].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[108].reasonform_id     |                                                                              |
                  | data[108].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[108].is_smart_asset    | 1                                                                            |
                  | data[108].asset_type_id     | 1                                                                            |

                  | data[109].name              | AssetTest1                                                                   |
                  | data[109].description       | description1                                                                 |
                  | data[109].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[109].is_active         | 1                                                                            |
                  | data[109].is_autoapprove    | 1                                                                            |
                  | data[109].price             | 50000                                                                        |
                  | data[109].qrcodeenable      | 1                                                                            |
                  | data[109].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[109].reasonform_id     |                                                                              |
                  | data[109].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[109].is_smart_asset    | 1                                                                            |
                  | data[109].asset_type_id     | 1                                                                            |

                  | data[110].name              | AssetTest1                                                                   |
                  | data[110].description       | description1                                                                 |
                  | data[110].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[110].is_active         | 1                                                                            |
                  | data[110].is_autoapprove    | 1                                                                            |
                  | data[110].price             | 50000                                                                        |
                  | data[110].qrcodeenable      | 1                                                                            |
                  | data[110].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[110].reasonform_id     |                                                                              |
                  | data[110].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[110].is_smart_asset    | 1                                                                            |
                  | data[110].asset_type_id     | 1                                                                            |

                  | data[111].name              | AssetTest1                                                                   |
                  | data[111].description       | description1                                                                 |
                  | data[111].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[111].is_active         | 1                                                                            |
                  | data[111].is_autoapprove    | 1                                                                            |
                  | data[111].price             | 50000                                                                        |
                  | data[111].qrcodeenable      | 1                                                                            |
                  | data[111].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[111].reasonform_id     |                                                                              |
                  | data[111].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[111].is_smart_asset    | 1                                                                            |
                  | data[111].asset_type_id     | 1                                                                            |

                  | data[112].name              | AssetTest1                                                                   |
                  | data[112].description       | description1                                                                 |
                  | data[112].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[112].is_active         | 1                                                                            |
                  | data[112].is_autoapprove    | 1                                                                            |
                  | data[112].price             | 50000                                                                        |
                  | data[112].qrcodeenable      | 1                                                                            |
                  | data[112].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[112].reasonform_id     |                                                                              |
                  | data[112].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[112].is_smart_asset    | 1                                                                            |
                  | data[112].asset_type_id     | 1                                                                            |

                  | data[113].name              | AssetTest1                                                                   |
                  | data[113].description       | description1                                                                 |
                  | data[113].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[113].is_active         | 1                                                                            |
                  | data[113].is_autoapprove    | 1                                                                            |
                  | data[113].price             | 50000                                                                        |
                  | data[113].qrcodeenable      | 1                                                                            |
                  | data[113].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[113].reasonform_id     |                                                                              |
                  | data[113].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[113].is_smart_asset    | 1                                                                            |
                  | data[113].asset_type_id     | 1                                                                            |

                  | data[114].name              | AssetTest1                                                                   |
                  | data[114].description       | description1                                                                 |
                  | data[114].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[114].is_active         | 1                                                                            |
                  | data[114].is_autoapprove    | 1                                                                            |
                  | data[114].price             | 50000                                                                        |
                  | data[114].qrcodeenable      | 1                                                                            |
                  | data[114].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[114].reasonform_id     |                                                                              |
                  | data[114].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[114].is_smart_asset    | 1                                                                            |
                  | data[114].asset_type_id     | 1                                                                            |

                  | data[115].name              | AssetTest1                                                                   |
                  | data[115].description       | description1                                                                 |
                  | data[115].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[115].is_active         | 1                                                                            |
                  | data[115].is_autoapprove    | 1                                                                            |
                  | data[115].price             | 50000                                                                        |
                  | data[115].qrcodeenable      | 1                                                                            |
                  | data[115].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[115].reasonform_id     |                                                                              |
                  | data[115].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[115].is_smart_asset    | 1                                                                            |
                  | data[115].asset_type_id     | 1                                                                            |

                  | data[116].name              | AssetTest1                                                                   |
                  | data[116].description       | description1                                                                 |
                  | data[116].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[116].is_active         | 1                                                                            |
                  | data[116].is_autoapprove    | 1                                                                            |
                  | data[116].price             | 50000                                                                        |
                  | data[116].qrcodeenable      | 1                                                                            |
                  | data[116].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[116].reasonform_id     |                                                                              |
                  | data[116].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[116].is_smart_asset    | 1                                                                            |
                  | data[116].asset_type_id     | 1                                                                            |

                  | data[117].name              | AssetTest1                                                                   |
                  | data[117].description       | description1                                                                 |
                  | data[117].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[117].is_active         | 1                                                                            |
                  | data[117].is_autoapprove    | 1                                                                            |
                  | data[117].price             | 50000                                                                        |
                  | data[117].qrcodeenable      | 1                                                                            |
                  | data[117].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[117].reasonform_id     |                                                                              |
                  | data[117].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[117].is_smart_asset    | 1                                                                            |
                  | data[117].asset_type_id     | 1                                                                            |

                  | data[118].name              | AssetTest1                                                                   |
                  | data[118].description       | description1                                                                 |
                  | data[118].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[118].is_active         | 1                                                                            |
                  | data[118].is_autoapprove    | 1                                                                            |
                  | data[118].price             | 50000                                                                        |
                  | data[118].qrcodeenable      | 1                                                                            |
                  | data[118].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[118].reasonform_id     |                                                                              |
                  | data[118].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[118].is_smart_asset    | 1                                                                            |
                  | data[118].asset_type_id     | 1                                                                            |

                  | data[119].name              | AssetTest1                                                                   |
                  | data[119].description       | description1                                                                 |
                  | data[119].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[119].is_active         | 1                                                                            |
                  | data[119].is_autoapprove    | 1                                                                            |
                  | data[119].price             | 50000                                                                        |
                  | data[119].qrcodeenable      | 1                                                                            |
                  | data[119].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[119].reasonform_id     |                                                                              |
                  | data[119].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[119].is_smart_asset    | 1                                                                            |
                  | data[119].asset_type_id     | 1                                                                            |

                  | data[120].name              | AssetTest1                                                                   |
                  | data[120].description       | description1                                                                 |
                  | data[120].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[120].is_active         | 1                                                                            |
                  | data[120].is_autoapprove    | 1                                                                            |
                  | data[120].price             | 50000                                                                        |
                  | data[120].qrcodeenable      | 1                                                                            |
                  | data[120].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[120].reasonform_id     |                                                                              |
                  | data[120].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[120].is_smart_asset    | 1                                                                            |
                  | data[120].asset_type_id     | 1                                                                            |

                  | data[121].name              | AssetTest1                                                                   |
                  | data[121].description       | description1                                                                 |
                  | data[121].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[121].is_active         | 1                                                                            |
                  | data[121].is_autoapprove    | 1                                                                            |
                  | data[121].price             | 50000                                                                        |
                  | data[121].qrcodeenable      | 1                                                                            |
                  | data[121].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[121].reasonform_id     |                                                                              |
                  | data[121].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[121].is_smart_asset    | 1                                                                            |
                  | data[121].asset_type_id     | 1                                                                            |

                  | data[122].name              | AssetTest1                                                                   |
                  | data[122].description       | description1                                                                 |
                  | data[122].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[122].is_active         | 1                                                                            |
                  | data[122].is_autoapprove    | 1                                                                            |
                  | data[122].price             | 50000                                                                        |
                  | data[122].qrcodeenable      | 1                                                                            |
                  | data[122].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[122].reasonform_id     |                                                                              |
                  | data[122].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[122].is_smart_asset    | 1                                                                            |
                  | data[122].asset_type_id     | 1                                                                            |

                  | data[123].name              | AssetTest1                                                                   |
                  | data[123].description       | description1                                                                 |
                  | data[123].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[123].is_active         | 1                                                                            |
                  | data[123].is_autoapprove    | 1                                                                            |
                  | data[123].price             | 50000                                                                        |
                  | data[123].qrcodeenable      | 1                                                                            |
                  | data[123].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[123].reasonform_id     |                                                                              |
                  | data[123].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[123].is_smart_asset    | 1                                                                            |
                  | data[123].asset_type_id     | 1                                                                            |

                  | data[124].name              | AssetTest1                                                                   |
                  | data[124].description       | description1                                                                 |
                  | data[124].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[124].is_active         | 1                                                                            |
                  | data[124].is_autoapprove    | 1                                                                            |
                  | data[124].price             | 50000                                                                        |
                  | data[124].qrcodeenable      | 1                                                                            |
                  | data[124].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[124].reasonform_id     |                                                                              |
                  | data[124].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[124].is_smart_asset    | 1                                                                            |
                  | data[124].asset_type_id     | 1                                                                            |

                  | data[125].name              | AssetTest1                                                                   |
                  | data[125].description       | description1                                                                 |
                  | data[125].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[125].is_active         | 1                                                                            |
                  | data[125].is_autoapprove    | 1                                                                            |
                  | data[125].price             | 50000                                                                        |
                  | data[125].qrcodeenable      | 1                                                                            |
                  | data[125].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[125].reasonform_id     |                                                                              |
                  | data[125].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[125].is_smart_asset    | 1                                                                            |
                  | data[125].asset_type_id     | 1                                                                            |

                  | data[126].name              | AssetTest1                                                                   |
                  | data[126].description       | description1                                                                 |
                  | data[126].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[126].is_active         | 1                                                                            |
                  | data[126].is_autoapprove    | 1                                                                            |
                  | data[126].price             | 50000                                                                        |
                  | data[126].qrcodeenable      | 1                                                                            |
                  | data[126].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[126].reasonform_id     |                                                                              |
                  | data[126].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[126].is_smart_asset    | 1                                                                            |
                  | data[126].asset_type_id     | 1                                                                            |

                  | data[127].name              | AssetTest1                                                                   |
                  | data[127].description       | description1                                                                 |
                  | data[127].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[127].is_active         | 1                                                                            |
                  | data[127].is_autoapprove    | 1                                                                            |
                  | data[127].price             | 50000                                                                        |
                  | data[127].qrcodeenable      | 1                                                                            |
                  | data[127].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[127].reasonform_id     |                                                                              |
                  | data[127].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[127].is_smart_asset    | 1                                                                            |
                  | data[127].asset_type_id     | 1                                                                            |

                  | data[128].name              | AssetTest1                                                                   |
                  | data[128].description       | description1                                                                 |
                  | data[128].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[128].is_active         | 1                                                                            |
                  | data[128].is_autoapprove    | 1                                                                            |
                  | data[128].price             | 50000                                                                        |
                  | data[128].qrcodeenable      | 1                                                                            |
                  | data[128].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[128].reasonform_id     |                                                                              |
                  | data[128].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[128].is_smart_asset    | 1                                                                            |
                  | data[128].asset_type_id     | 1                                                                            |

                  | data[129].name              | AssetTest1                                                                   |
                  | data[129].description       | description1                                                                 |
                  | data[129].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[129].is_active         | 1                                                                            |
                  | data[129].is_autoapprove    | 1                                                                            |
                  | data[129].price             | 50000                                                                        |
                  | data[129].qrcodeenable      | 1                                                                            |
                  | data[129].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[129].reasonform_id     |                                                                              |
                  | data[129].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[129].is_smart_asset    | 1                                                                            |
                  | data[129].asset_type_id     | 1                                                                            |

                  | data[130].name              | AssetTest1                                                                   |
                  | data[130].description       | description1                                                                 |
                  | data[130].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[130].is_active         | 1                                                                            |
                  | data[130].is_autoapprove    | 1                                                                            |
                  | data[130].price             | 50000                                                                        |
                  | data[130].qrcodeenable      | 1                                                                            |
                  | data[130].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[130].reasonform_id     |                                                                              |
                  | data[130].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[130].is_smart_asset    | 1                                                                            |
                  | data[130].asset_type_id     | 1                                                                            |

                  | data[131].name              | AssetTest1                                                                   |
                  | data[131].description       | description1                                                                 |
                  | data[131].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[131].is_active         | 1                                                                            |
                  | data[131].is_autoapprove    | 1                                                                            |
                  | data[131].price             | 50000                                                                        |
                  | data[131].qrcodeenable      | 1                                                                            |
                  | data[131].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[131].reasonform_id     |                                                                              |
                  | data[131].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[131].is_smart_asset    | 1                                                                            |
                  | data[131].asset_type_id     | 1                                                                            |

                  | data[132].name              | AssetTest1                                                                   |
                  | data[132].description       | description1                                                                 |
                  | data[132].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[132].is_active         | 1                                                                            |
                  | data[132].is_autoapprove    | 1                                                                            |
                  | data[132].price             | 50000                                                                        |
                  | data[132].qrcodeenable      | 1                                                                            |
                  | data[132].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[132].reasonform_id     |                                                                              |
                  | data[132].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[132].is_smart_asset    | 1                                                                            |
                  | data[132].asset_type_id     | 1                                                                            |

                  | data[133].name              | AssetTest1                                                                   |
                  | data[133].description       | description1                                                                 |
                  | data[133].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[133].is_active         | 1                                                                            |
                  | data[133].is_autoapprove    | 1                                                                            |
                  | data[133].price             | 50000                                                                        |
                  | data[133].qrcodeenable      | 1                                                                            |
                  | data[133].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[133].reasonform_id     |                                                                              |
                  | data[133].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[133].is_smart_asset    | 1                                                                            |
                  | data[133].asset_type_id     | 1                                                                            |

                  | data[134].name              | AssetTest1                                                                   |
                  | data[134].description       | description1                                                                 |
                  | data[134].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[134].is_active         | 1                                                                            |
                  | data[134].is_autoapprove    | 1                                                                            |
                  | data[134].price             | 50000                                                                        |
                  | data[134].qrcodeenable      | 1                                                                            |
                  | data[134].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[134].reasonform_id     |                                                                              |
                  | data[134].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[134].is_smart_asset    | 1                                                                            |
                  | data[134].asset_type_id     | 1                                                                            |

                  | data[135].name              | AssetTest1                                                                   |
                  | data[135].description       | description1                                                                 |
                  | data[135].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[135].is_active         | 1                                                                            |
                  | data[135].is_autoapprove    | 1                                                                            |
                  | data[135].price             | 50000                                                                        |
                  | data[135].qrcodeenable      | 1                                                                            |
                  | data[135].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[135].reasonform_id     |                                                                              |
                  | data[135].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[135].is_smart_asset    | 1                                                                            |
                  | data[135].asset_type_id     | 1                                                                            |

                  | data[136].name              | AssetTest1                                                                   |
                  | data[136].description       | description1                                                                 |
                  | data[136].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[136].is_active         | 1                                                                            |
                  | data[136].is_autoapprove    | 1                                                                            |
                  | data[136].price             | 50000                                                                        |
                  | data[136].qrcodeenable      | 1                                                                            |
                  | data[136].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[136].reasonform_id     |                                                                              |
                  | data[136].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[136].is_smart_asset    | 1                                                                            |
                  | data[136].asset_type_id     | 1                                                                            |

                  | data[137].name              | AssetTest1                                                                   |
                  | data[137].description       | description1                                                                 |
                  | data[137].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[137].is_active         | 1                                                                            |
                  | data[137].is_autoapprove    | 1                                                                            |
                  | data[137].price             | 50000                                                                        |
                  | data[137].qrcodeenable      | 1                                                                            |
                  | data[137].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[137].reasonform_id     |                                                                              |
                  | data[137].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[137].is_smart_asset    | 1                                                                            |
                  | data[137].asset_type_id     | 1                                                                            |

                  | data[138].name              | AssetTest1                                                                   |
                  | data[138].description       | description1                                                                 |
                  | data[138].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[138].is_active         | 1                                                                            |
                  | data[138].is_autoapprove    | 1                                                                            |
                  | data[138].price             | 50000                                                                        |
                  | data[138].qrcodeenable      | 1                                                                            |
                  | data[138].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[138].reasonform_id     |                                                                              |
                  | data[138].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[138].is_smart_asset    | 1                                                                            |
                  | data[138].asset_type_id     | 1                                                                            |

                  | data[139].name              | AssetTest1                                                                   |
                  | data[139].description       | description1                                                                 |
                  | data[139].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[139].is_active         | 1                                                                            |
                  | data[139].is_autoapprove    | 1                                                                            |
                  | data[139].price             | 50000                                                                        |
                  | data[139].qrcodeenable      | 1                                                                            |
                  | data[139].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[139].reasonform_id     |                                                                              |
                  | data[139].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[139].is_smart_asset    | 1                                                                            |
                  | data[139].asset_type_id     | 1                                                                            |

                  | data[140].name              | AssetTest1                                                                   |
                  | data[140].description       | description1                                                                 |
                  | data[140].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[140].is_active         | 1                                                                            |
                  | data[140].is_autoapprove    | 1                                                                            |
                  | data[140].price             | 50000                                                                        |
                  | data[140].qrcodeenable      | 1                                                                            |
                  | data[140].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[140].reasonform_id     |                                                                              |
                  | data[140].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[140].is_smart_asset    | 1                                                                            |
                  | data[140].asset_type_id     | 1                                                                            |

                  | data[141].name              | AssetTest1                                                                   |
                  | data[141].description       | description1                                                                 |
                  | data[141].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[141].is_active         | 1                                                                            |
                  | data[141].is_autoapprove    | 1                                                                            |
                  | data[141].price             | 50000                                                                        |
                  | data[141].qrcodeenable      | 1                                                                            |
                  | data[141].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[141].reasonform_id     |                                                                              |
                  | data[141].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[141].is_smart_asset    | 1                                                                            |
                  | data[141].asset_type_id     | 1                                                                            |

                  | data[142].name              | AssetTest1                                                                   |
                  | data[142].description       | description1                                                                 |
                  | data[142].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[142].is_active         | 1                                                                            |
                  | data[142].is_autoapprove    | 1                                                                            |
                  | data[142].price             | 50000                                                                        |
                  | data[142].qrcodeenable      | 1                                                                            |
                  | data[142].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[142].reasonform_id     |                                                                              |
                  | data[142].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[142].is_smart_asset    | 1                                                                            |
                  | data[142].asset_type_id     | 1                                                                            |

                  | data[143].name              | AssetTest1                                                                   |
                  | data[143].description       | description1                                                                 |
                  | data[143].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[143].is_active         | 1                                                                            |
                  | data[143].is_autoapprove    | 1                                                                            |
                  | data[143].price             | 50000                                                                        |
                  | data[143].qrcodeenable      | 1                                                                            |
                  | data[143].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[143].reasonform_id     |                                                                              |
                  | data[143].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[143].is_smart_asset    | 1                                                                            |
                  | data[143].asset_type_id     | 1                                                                            |

                  | data[144].name              | AssetTest1                                                                   |
                  | data[144].description       | description1                                                                 |
                  | data[144].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[144].is_active         | 1                                                                            |
                  | data[144].is_autoapprove    | 1                                                                            |
                  | data[144].price             | 50000                                                                        |
                  | data[144].qrcodeenable      | 1                                                                            |
                  | data[144].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[144].reasonform_id     |                                                                              |
                  | data[144].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[144].is_smart_asset    | 1                                                                            |
                  | data[144].asset_type_id     | 1                                                                            |

                  | data[145].name              | AssetTest1                                                                   |
                  | data[145].description       | description1                                                                 |
                  | data[145].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[145].is_active         | 1                                                                            |
                  | data[145].is_autoapprove    | 1                                                                            |
                  | data[145].price             | 50000                                                                        |
                  | data[145].qrcodeenable      | 1                                                                            |
                  | data[145].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[145].reasonform_id     |                                                                              |
                  | data[145].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[145].is_smart_asset    | 1                                                                            |
                  | data[145].asset_type_id     | 1                                                                            |

                  | data[146].name              | AssetTest1                                                                   |
                  | data[146].description       | description1                                                                 |
                  | data[146].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[146].is_active         | 1                                                                            |
                  | data[146].is_autoapprove    | 1                                                                            |
                  | data[146].price             | 50000                                                                        |
                  | data[146].qrcodeenable      | 1                                                                            |
                  | data[146].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[146].reasonform_id     |                                                                              |
                  | data[146].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[146].is_smart_asset    | 1                                                                            |
                  | data[146].asset_type_id     | 1                                                                            |

                  | data[147].name              | AssetTest1                                                                   |
                  | data[147].description       | description1                                                                 |
                  | data[147].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[147].is_active         | 1                                                                            |
                  | data[147].is_autoapprove    | 1                                                                            |
                  | data[147].price             | 50000                                                                        |
                  | data[147].qrcodeenable      | 1                                                                            |
                  | data[147].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[147].reasonform_id     |                                                                              |
                  | data[147].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[147].is_smart_asset    | 1                                                                            |
                  | data[147].asset_type_id     | 1                                                                            |

                  | data[148].name              | AssetTest1                                                                   |
                  | data[148].description       | description1                                                                 |
                  | data[148].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[148].is_active         | 1                                                                            |
                  | data[148].is_autoapprove    | 1                                                                            |
                  | data[148].price             | 50000                                                                        |
                  | data[148].qrcodeenable      | 1                                                                            |
                  | data[148].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[148].reasonform_id     |                                                                              |
                  | data[148].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[148].is_smart_asset    | 1                                                                            |
                  | data[148].asset_type_id     | 1                                                                            |

                  | data[149].name              | AssetTest1                                                                   |
                  | data[149].description       | description1                                                                 |
                  | data[149].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[149].is_active         | 1                                                                            |
                  | data[149].is_autoapprove    | 1                                                                            |
                  | data[149].price             | 50000                                                                        |
                  | data[149].qrcodeenable      | 1                                                                            |
                  | data[149].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[149].reasonform_id     |                                                                              |
                  | data[149].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[149].is_smart_asset    | 1                                                                            |
                  | data[149].asset_type_id     | 1                                                                            |

                  | data[150].name              | AssetTest1                                                                   |
                  | data[150].description       | description1                                                                 |
                  | data[150].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[150].is_active         | 1                                                                            |
                  | data[150].is_autoapprove    | 1                                                                            |
                  | data[150].price             | 50000                                                                        |
                  | data[150].qrcodeenable      | 1                                                                            |
                  | data[150].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[150].reasonform_id     |                                                                              |
                  | data[150].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[150].is_smart_asset    | 1                                                                            |
                  | data[150].asset_type_id     | 1                                                                            |

                  | data[151].name              | AssetTest1                                                                   |
                  | data[151].description       | description1                                                                 |
                  | data[151].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[151].is_active         | 1                                                                            |
                  | data[151].is_autoapprove    | 1                                                                            |
                  | data[151].price             | 50000                                                                        |
                  | data[151].qrcodeenable      | 1                                                                            |
                  | data[151].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[151].reasonform_id     |                                                                              |
                  | data[151].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[151].is_smart_asset    | 1                                                                            |
                  | data[151].asset_type_id     | 1                                                                            |

                  | data[152].name              | AssetTest1                                                                   |
                  | data[152].description       | description1                                                                 |
                  | data[152].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[152].is_active         | 1                                                                            |
                  | data[152].is_autoapprove    | 1                                                                            |
                  | data[152].price             | 50000                                                                        |
                  | data[152].qrcodeenable      | 1                                                                            |
                  | data[152].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[152].reasonform_id     |                                                                              |
                  | data[152].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[152].is_smart_asset    | 1                                                                            |
                  | data[152].asset_type_id     | 1                                                                            |

                  | data[153].name              | AssetTest1                                                                   |
                  | data[153].description       | description1                                                                 |
                  | data[153].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[153].is_active         | 1                                                                            |
                  | data[153].is_autoapprove    | 1                                                                            |
                  | data[153].price             | 50000                                                                        |
                  | data[153].qrcodeenable      | 1                                                                            |
                  | data[153].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[153].reasonform_id     |                                                                              |
                  | data[153].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[153].is_smart_asset    | 1                                                                            |
                  | data[153].asset_type_id     | 1                                                                            |

                  | data[154].name              | AssetTest1                                                                   |
                  | data[154].description       | description1                                                                 |
                  | data[154].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[154].is_active         | 1                                                                            |
                  | data[154].is_autoapprove    | 1                                                                            |
                  | data[154].price             | 50000                                                                        |
                  | data[154].qrcodeenable      | 1                                                                            |
                  | data[154].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[154].reasonform_id     |                                                                              |
                  | data[154].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[154].is_smart_asset    | 1                                                                            |
                  | data[154].asset_type_id     | 1                                                                            |

                  | data[155].name              | AssetTest1                                                                   |
                  | data[155].description       | description1                                                                 |
                  | data[155].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[155].is_active         | 1                                                                            |
                  | data[155].is_autoapprove    | 1                                                                            |
                  | data[155].price             | 50000                                                                        |
                  | data[155].qrcodeenable      | 1                                                                            |
                  | data[155].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[155].reasonform_id     |                                                                              |
                  | data[155].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[155].is_smart_asset    | 1                                                                            |
                  | data[155].asset_type_id     | 1                                                                            |

                  | data[156].name              | AssetTest1                                                                   |
                  | data[156].description       | description1                                                                 |
                  | data[156].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[156].is_active         | 1                                                                            |
                  | data[156].is_autoapprove    | 1                                                                            |
                  | data[156].price             | 50000                                                                        |
                  | data[156].qrcodeenable      | 1                                                                            |
                  | data[156].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[156].reasonform_id     |                                                                              |
                  | data[156].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[156].is_smart_asset    | 1                                                                            |
                  | data[156].asset_type_id     | 1                                                                            |

                  | data[157].name              | AssetTest1                                                                   |
                  | data[157].description       | description1                                                                 |
                  | data[157].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[157].is_active         | 1                                                                            |
                  | data[157].is_autoapprove    | 1                                                                            |
                  | data[157].price             | 50000                                                                        |
                  | data[157].qrcodeenable      | 1                                                                            |
                  | data[157].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[157].reasonform_id     |                                                                              |
                  | data[157].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[157].is_smart_asset    | 1                                                                            |
                  | data[157].asset_type_id     | 1                                                                            |

                  | data[158].name              | AssetTest1                                                                   |
                  | data[158].description       | description1                                                                 |
                  | data[158].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[158].is_active         | 1                                                                            |
                  | data[158].is_autoapprove    | 1                                                                            |
                  | data[158].price             | 50000                                                                        |
                  | data[158].qrcodeenable      | 1                                                                            |
                  | data[158].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[158].reasonform_id     |                                                                              |
                  | data[158].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[158].is_smart_asset    | 1                                                                            |
                  | data[158].asset_type_id     | 1                                                                            |

                  | data[159].name              | AssetTest1                                                                   |
                  | data[159].description       | description1                                                                 |
                  | data[159].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[159].is_active         | 1                                                                            |
                  | data[159].is_autoapprove    | 1                                                                            |
                  | data[159].price             | 50000                                                                        |
                  | data[159].qrcodeenable      | 1                                                                            |
                  | data[159].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[159].reasonform_id     |                                                                              |
                  | data[159].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[159].is_smart_asset    | 1                                                                            |
                  | data[159].asset_type_id     | 1                                                                            |

                  | data[160].name              | AssetTest1                                                                   |
                  | data[160].description       | description1                                                                 |
                  | data[160].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[160].is_active         | 1                                                                            |
                  | data[160].is_autoapprove    | 1                                                                            |
                  | data[160].price             | 50000                                                                        |
                  | data[160].qrcodeenable      | 1                                                                            |
                  | data[160].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[160].reasonform_id     |                                                                              |
                  | data[160].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[160].is_smart_asset    | 1                                                                            |
                  | data[160].asset_type_id     | 1                                                                            |

                  | data[161].name              | AssetTest1                                                                   |
                  | data[161].description       | description1                                                                 |
                  | data[161].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[161].is_active         | 1                                                                            |
                  | data[161].is_autoapprove    | 1                                                                            |
                  | data[161].price             | 50000                                                                        |
                  | data[161].qrcodeenable      | 1                                                                            |
                  | data[161].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[161].reasonform_id     |                                                                              |
                  | data[161].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[161].is_smart_asset    | 1                                                                            |
                  | data[161].asset_type_id     | 1                                                                            |

                  | data[162].name              | AssetTest1                                                                   |
                  | data[162].description       | description1                                                                 |
                  | data[162].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[162].is_active         | 1                                                                            |
                  | data[162].is_autoapprove    | 1                                                                            |
                  | data[162].price             | 50000                                                                        |
                  | data[162].qrcodeenable      | 1                                                                            |
                  | data[162].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[162].reasonform_id     |                                                                              |
                  | data[162].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[162].is_smart_asset    | 1                                                                            |
                  | data[162].asset_type_id     | 1                                                                            |

                  | data[163].name              | AssetTest1                                                                   |
                  | data[163].description       | description1                                                                 |
                  | data[163].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[163].is_active         | 1                                                                            |
                  | data[163].is_autoapprove    | 1                                                                            |
                  | data[163].price             | 50000                                                                        |
                  | data[163].qrcodeenable      | 1                                                                            |
                  | data[163].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[163].reasonform_id     |                                                                              |
                  | data[163].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[163].is_smart_asset    | 1                                                                            |
                  | data[163].asset_type_id     | 1                                                                            |

                  | data[164].name              | AssetTest1                                                                   |
                  | data[164].description       | description1                                                                 |
                  | data[164].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[164].is_active         | 1                                                                            |
                  | data[164].is_autoapprove    | 1                                                                            |
                  | data[164].price             | 50000                                                                        |
                  | data[164].qrcodeenable      | 1                                                                            |
                  | data[164].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[164].reasonform_id     |                                                                              |
                  | data[164].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[164].is_smart_asset    | 1                                                                            |
                  | data[164].asset_type_id     | 1                                                                            |

                  | data[165].name              | AssetTest1                                                                   |
                  | data[165].description       | description1                                                                 |
                  | data[165].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[165].is_active         | 1                                                                            |
                  | data[165].is_autoapprove    | 1                                                                            |
                  | data[165].price             | 50000                                                                        |
                  | data[165].qrcodeenable      | 1                                                                            |
                  | data[165].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[165].reasonform_id     |                                                                              |
                  | data[165].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[165].is_smart_asset    | 1                                                                            |
                  | data[165].asset_type_id     | 1                                                                            |

                  | data[166].name              | AssetTest1                                                                   |
                  | data[166].description       | description1                                                                 |
                  | data[166].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[166].is_active         | 1                                                                            |
                  | data[166].is_autoapprove    | 1                                                                            |
                  | data[166].price             | 50000                                                                        |
                  | data[166].qrcodeenable      | 1                                                                            |
                  | data[166].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[166].reasonform_id     |                                                                              |
                  | data[166].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[166].is_smart_asset    | 1                                                                            |
                  | data[166].asset_type_id     | 1                                                                            |

                  | data[167].name              | AssetTest1                                                                   |
                  | data[167].description       | description1                                                                 |
                  | data[167].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[167].is_active         | 1                                                                            |
                  | data[167].is_autoapprove    | 1                                                                            |
                  | data[167].price             | 50000                                                                        |
                  | data[167].qrcodeenable      | 1                                                                            |
                  | data[167].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[167].reasonform_id     |                                                                              |
                  | data[167].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[167].is_smart_asset    | 1                                                                            |
                  | data[167].asset_type_id     | 1                                                                            |

                  | data[168].name              | AssetTest1                                                                   |
                  | data[168].description       | description1                                                                 |
                  | data[168].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[168].is_active         | 1                                                                            |
                  | data[168].is_autoapprove    | 1                                                                            |
                  | data[168].price             | 50000                                                                        |
                  | data[168].qrcodeenable      | 1                                                                            |
                  | data[168].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[168].reasonform_id     |                                                                              |
                  | data[168].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[168].is_smart_asset    | 1                                                                            |
                  | data[168].asset_type_id     | 1                                                                            |

                  | data[169].name              | AssetTest1                                                                   |
                  | data[169].description       | description1                                                                 |
                  | data[169].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[169].is_active         | 1                                                                            |
                  | data[169].is_autoapprove    | 1                                                                            |
                  | data[169].price             | 50000                                                                        |
                  | data[169].qrcodeenable      | 1                                                                            |
                  | data[169].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[169].reasonform_id     |                                                                              |
                  | data[169].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[169].is_smart_asset    | 1                                                                            |
                  | data[169].asset_type_id     | 1                                                                            |

                  | data[170].name              | AssetTest1                                                                   |
                  | data[170].description       | description1                                                                 |
                  | data[170].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[170].is_active         | 1                                                                            |
                  | data[170].is_autoapprove    | 1                                                                            |
                  | data[170].price             | 50000                                                                        |
                  | data[170].qrcodeenable      | 1                                                                            |
                  | data[170].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[170].reasonform_id     |                                                                              |
                  | data[170].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[170].is_smart_asset    | 1                                                                            |
                  | data[170].asset_type_id     | 1                                                                            |

                  | data[171].name              | AssetTest1                                                                   |
                  | data[171].description       | description1                                                                 |
                  | data[171].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[171].is_active         | 1                                                                            |
                  | data[171].is_autoapprove    | 1                                                                            |
                  | data[171].price             | 50000                                                                        |
                  | data[171].qrcodeenable      | 1                                                                            |
                  | data[171].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[171].reasonform_id     |                                                                              |
                  | data[171].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[171].is_smart_asset    | 1                                                                            |
                  | data[171].asset_type_id     | 1                                                                            |

                  | data[172].name              | AssetTest1                                                                   |
                  | data[172].description       | description1                                                                 |
                  | data[172].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[172].is_active         | 1                                                                            |
                  | data[172].is_autoapprove    | 1                                                                            |
                  | data[172].price             | 50000                                                                        |
                  | data[172].qrcodeenable      | 1                                                                            |
                  | data[172].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[172].reasonform_id     |                                                                              |
                  | data[172].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[172].is_smart_asset    | 1                                                                            |
                  | data[172].asset_type_id     | 1                                                                            |

                  | data[173].name              | AssetTest1                                                                   |
                  | data[173].description       | description1                                                                 |
                  | data[173].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[173].is_active         | 1                                                                            |
                  | data[173].is_autoapprove    | 1                                                                            |
                  | data[173].price             | 50000                                                                        |
                  | data[173].qrcodeenable      | 1                                                                            |
                  | data[173].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[173].reasonform_id     |                                                                              |
                  | data[173].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[173].is_smart_asset    | 1                                                                            |
                  | data[173].asset_type_id     | 1                                                                            |

                  | data[174].name              | AssetTest1                                                                   |
                  | data[174].description       | description1                                                                 |
                  | data[174].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[174].is_active         | 1                                                                            |
                  | data[174].is_autoapprove    | 1                                                                            |
                  | data[174].price             | 50000                                                                        |
                  | data[174].qrcodeenable      | 1                                                                            |
                  | data[174].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[174].reasonform_id     |                                                                              |
                  | data[174].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[174].is_smart_asset    | 1                                                                            |
                  | data[174].asset_type_id     | 1                                                                            |

                  | data[175].name              | AssetTest1                                                                   |
                  | data[175].description       | description1                                                                 |
                  | data[175].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[175].is_active         | 1                                                                            |
                  | data[175].is_autoapprove    | 1                                                                            |
                  | data[175].price             | 50000                                                                        |
                  | data[175].qrcodeenable      | 1                                                                            |
                  | data[175].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[175].reasonform_id     |                                                                              |
                  | data[175].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[175].is_smart_asset    | 1                                                                            |
                  | data[175].asset_type_id     | 1                                                                            |

                  | data[176].name              | AssetTest1                                                                   |
                  | data[176].description       | description1                                                                 |
                  | data[176].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[176].is_active         | 1                                                                            |
                  | data[176].is_autoapprove    | 1                                                                            |
                  | data[176].price             | 50000                                                                        |
                  | data[176].qrcodeenable      | 1                                                                            |
                  | data[176].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[176].reasonform_id     |                                                                              |
                  | data[176].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[176].is_smart_asset    | 1                                                                            |
                  | data[176].asset_type_id     | 1                                                                            |

                  | data[177].name              | AssetTest1                                                                   |
                  | data[177].description       | description1                                                                 |
                  | data[177].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[177].is_active         | 1                                                                            |
                  | data[177].is_autoapprove    | 1                                                                            |
                  | data[177].price             | 50000                                                                        |
                  | data[177].qrcodeenable      | 1                                                                            |
                  | data[177].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[177].reasonform_id     |                                                                              |
                  | data[177].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[177].is_smart_asset    | 1                                                                            |
                  | data[177].asset_type_id     | 1                                                                            |

                  | data[178].name              | AssetTest1                                                                   |
                  | data[178].description       | description1                                                                 |
                  | data[178].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[178].is_active         | 1                                                                            |
                  | data[178].is_autoapprove    | 1                                                                            |
                  | data[178].price             | 50000                                                                        |
                  | data[178].qrcodeenable      | 1                                                                            |
                  | data[178].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[178].reasonform_id     |                                                                              |
                  | data[178].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[178].is_smart_asset    | 1                                                                            |
                  | data[178].asset_type_id     | 1                                                                            |

                  | data[179].name              | AssetTest1                                                                   |
                  | data[179].description       | description1                                                                 |
                  | data[179].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[179].is_active         | 1                                                                            |
                  | data[179].is_autoapprove    | 1                                                                            |
                  | data[179].price             | 50000                                                                        |
                  | data[179].qrcodeenable      | 1                                                                            |
                  | data[179].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[179].reasonform_id     |                                                                              |
                  | data[179].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[179].is_smart_asset    | 1                                                                            |
                  | data[179].asset_type_id     | 1                                                                            |

                  | data[180].name              | AssetTest1                                                                   |
                  | data[180].description       | description1                                                                 |
                  | data[180].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[180].is_active         | 1                                                                            |
                  | data[180].is_autoapprove    | 1                                                                            |
                  | data[180].price             | 50000                                                                        |
                  | data[180].qrcodeenable      | 1                                                                            |
                  | data[180].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[180].reasonform_id     |                                                                              |
                  | data[180].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[180].is_smart_asset    | 1                                                                            |
                  | data[180].asset_type_id     | 1                                                                            |

                  | data[181].name              | AssetTest1                                                                   |
                  | data[181].description       | description1                                                                 |
                  | data[181].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[181].is_active         | 1                                                                            |
                  | data[181].is_autoapprove    | 1                                                                            |
                  | data[181].price             | 50000                                                                        |
                  | data[181].qrcodeenable      | 1                                                                            |
                  | data[181].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[181].reasonform_id     |                                                                              |
                  | data[181].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[181].is_smart_asset    | 1                                                                            |
                  | data[181].asset_type_id     | 1                                                                            |

                  | data[182].name              | AssetTest1                                                                   |
                  | data[182].description       | description1                                                                 |
                  | data[182].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[182].is_active         | 1                                                                            |
                  | data[182].is_autoapprove    | 1                                                                            |
                  | data[182].price             | 50000                                                                        |
                  | data[182].qrcodeenable      | 1                                                                            |
                  | data[182].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[182].reasonform_id     |                                                                              |
                  | data[182].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[182].is_smart_asset    | 1                                                                            |
                  | data[182].asset_type_id     | 1                                                                            |

                  | data[183].name              | AssetTest1                                                                   |
                  | data[183].description       | description1                                                                 |
                  | data[183].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[183].is_active         | 1                                                                            |
                  | data[183].is_autoapprove    | 1                                                                            |
                  | data[183].price             | 50000                                                                        |
                  | data[183].qrcodeenable      | 1                                                                            |
                  | data[183].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[183].reasonform_id     |                                                                              |
                  | data[183].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[183].is_smart_asset    | 1                                                                            |
                  | data[183].asset_type_id     | 1                                                                            |

                  | data[184].name              | AssetTest1                                                                   |
                  | data[184].description       | description1                                                                 |
                  | data[184].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[184].is_active         | 1                                                                            |
                  | data[184].is_autoapprove    | 1                                                                            |
                  | data[184].price             | 50000                                                                        |
                  | data[184].qrcodeenable      | 1                                                                            |
                  | data[184].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[184].reasonform_id     |                                                                              |
                  | data[184].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[184].is_smart_asset    | 1                                                                            |
                  | data[184].asset_type_id     | 1                                                                            |

                  | data[185].name              | AssetTest1                                                                   |
                  | data[185].description       | description1                                                                 |
                  | data[185].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[185].is_active         | 1                                                                            |
                  | data[185].is_autoapprove    | 1                                                                            |
                  | data[185].price             | 50000                                                                        |
                  | data[185].qrcodeenable      | 1                                                                            |
                  | data[185].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[185].reasonform_id     |                                                                              |
                  | data[185].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[185].is_smart_asset    | 1                                                                            |
                  | data[185].asset_type_id     | 1                                                                            |

                  | data[186].name              | AssetTest1                                                                   |
                  | data[186].description       | description1                                                                 |
                  | data[186].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[186].is_active         | 1                                                                            |
                  | data[186].is_autoapprove    | 1                                                                            |
                  | data[186].price             | 50000                                                                        |
                  | data[186].qrcodeenable      | 1                                                                            |
                  | data[186].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[186].reasonform_id     |                                                                              |
                  | data[186].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[186].is_smart_asset    | 1                                                                            |
                  | data[186].asset_type_id     | 1                                                                            |

                  | data[187].name              | AssetTest1                                                                   |
                  | data[187].description       | description1                                                                 |
                  | data[187].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[187].is_active         | 1                                                                            |
                  | data[187].is_autoapprove    | 1                                                                            |
                  | data[187].price             | 50000                                                                        |
                  | data[187].qrcodeenable      | 1                                                                            |
                  | data[187].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[187].reasonform_id     |                                                                              |
                  | data[187].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[187].is_smart_asset    | 1                                                                            |
                  | data[187].asset_type_id     | 1                                                                            |

                  | data[188].name              | AssetTest1                                                                   |
                  | data[188].description       | description1                                                                 |
                  | data[188].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[188].is_active         | 1                                                                            |
                  | data[188].is_autoapprove    | 1                                                                            |
                  | data[188].price             | 50000                                                                        |
                  | data[188].qrcodeenable      | 1                                                                            |
                  | data[188].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[188].reasonform_id     |                                                                              |
                  | data[188].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[188].is_smart_asset    | 1                                                                            |
                  | data[188].asset_type_id     | 1                                                                            |

                  | data[189].name              | AssetTest1                                                                   |
                  | data[189].description       | description1                                                                 |
                  | data[189].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[189].is_active         | 1                                                                            |
                  | data[189].is_autoapprove    | 1                                                                            |
                  | data[189].price             | 50000                                                                        |
                  | data[189].qrcodeenable      | 1                                                                            |
                  | data[189].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[189].reasonform_id     |                                                                              |
                  | data[189].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[189].is_smart_asset    | 1                                                                            |
                  | data[189].asset_type_id     | 1                                                                            |

                  | data[190].name              | AssetTest1                                                                   |
                  | data[190].description       | description1                                                                 |
                  | data[190].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[190].is_active         | 1                                                                            |
                  | data[190].is_autoapprove    | 1                                                                            |
                  | data[190].price             | 50000                                                                        |
                  | data[190].qrcodeenable      | 1                                                                            |
                  | data[190].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[190].reasonform_id     |                                                                              |
                  | data[190].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[190].is_smart_asset    | 1                                                                            |
                  | data[190].asset_type_id     | 1                                                                            |

                  | data[191].name              | AssetTest1                                                                   |
                  | data[191].description       | description1                                                                 |
                  | data[191].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[191].is_active         | 1                                                                            |
                  | data[191].is_autoapprove    | 1                                                                            |
                  | data[191].price             | 50000                                                                        |
                  | data[191].qrcodeenable      | 1                                                                            |
                  | data[191].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[191].reasonform_id     |                                                                              |
                  | data[191].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[191].is_smart_asset    | 1                                                                            |
                  | data[191].asset_type_id     | 1                                                                            |

                  | data[192].name              | AssetTest1                                                                   |
                  | data[192].description       | description1                                                                 |
                  | data[192].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[192].is_active         | 1                                                                            |
                  | data[192].is_autoapprove    | 1                                                                            |
                  | data[192].price             | 50000                                                                        |
                  | data[192].qrcodeenable      | 1                                                                            |
                  | data[192].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[192].reasonform_id     |                                                                              |
                  | data[192].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[192].is_smart_asset    | 1                                                                            |
                  | data[192].asset_type_id     | 1                                                                            |

                  | data[193].name              | AssetTest1                                                                   |
                  | data[193].description       | description1                                                                 |
                  | data[193].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[193].is_active         | 1                                                                            |
                  | data[193].is_autoapprove    | 1                                                                            |
                  | data[193].price             | 50000                                                                        |
                  | data[193].qrcodeenable      | 1                                                                            |
                  | data[193].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[193].reasonform_id     |                                                                              |
                  | data[193].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[193].is_smart_asset    | 1                                                                            |
                  | data[193].asset_type_id     | 1                                                                            |

                  | data[194].name              | AssetTest1                                                                   |
                  | data[194].description       | description1                                                                 |
                  | data[194].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[194].is_active         | 1                                                                            |
                  | data[194].is_autoapprove    | 1                                                                            |
                  | data[194].price             | 50000                                                                        |
                  | data[194].qrcodeenable      | 1                                                                            |
                  | data[194].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[194].reasonform_id     |                                                                              |
                  | data[194].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[194].is_smart_asset    | 1                                                                            |
                  | data[194].asset_type_id     | 1                                                                            |

                  | data[195].name              | AssetTest1                                                                   |
                  | data[195].description       | description1                                                                 |
                  | data[195].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[195].is_active         | 1                                                                            |
                  | data[195].is_autoapprove    | 1                                                                            |
                  | data[195].price             | 50000                                                                        |
                  | data[195].qrcodeenable      | 1                                                                            |
                  | data[195].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[195].reasonform_id     |                                                                              |
                  | data[195].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[195].is_smart_asset    | 1                                                                            |
                  | data[195].asset_type_id     | 1                                                                            |

                  | data[196].name              | AssetTest1                                                                   |
                  | data[196].description       | description1                                                                 |
                  | data[196].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[196].is_active         | 1                                                                            |
                  | data[196].is_autoapprove    | 1                                                                            |
                  | data[196].price             | 50000                                                                        |
                  | data[196].qrcodeenable      | 1                                                                            |
                  | data[196].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[196].reasonform_id     |                                                                              |
                  | data[196].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[196].is_smart_asset    | 1                                                                            |
                  | data[196].asset_type_id     | 1                                                                            |

                  | data[197].name              | AssetTest1                                                                   |
                  | data[197].description       | description1                                                                 |
                  | data[197].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[197].is_active         | 1                                                                            |
                  | data[197].is_autoapprove    | 1                                                                            |
                  | data[197].price             | 50000                                                                        |
                  | data[197].qrcodeenable      | 1                                                                            |
                  | data[197].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[197].reasonform_id     |                                                                              |
                  | data[197].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[197].is_smart_asset    | 1                                                                            |
                  | data[197].asset_type_id     | 1                                                                            |

                  | data[198].name              | AssetTest1                                                                   |
                  | data[198].description       | description1                                                                 |
                  | data[198].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[198].is_active         | 1                                                                            |
                  | data[198].is_autoapprove    | 1                                                                            |
                  | data[198].price             | 50000                                                                        |
                  | data[198].qrcodeenable      | 1                                                                            |
                  | data[198].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[198].reasonform_id     |                                                                              |
                  | data[198].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[198].is_smart_asset    | 1                                                                            |
                  | data[198].asset_type_id     | 1                                                                            |

                  | data[199].name              | AssetTest1                                                                   |
                  | data[199].description       | description1                                                                 |
                  | data[199].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[199].is_active         | 1                                                                            |
                  | data[199].is_autoapprove    | 1                                                                            |
                  | data[199].price             | 50000                                                                        |
                  | data[199].qrcodeenable      | 1                                                                            |
                  | data[199].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[199].reasonform_id     |                                                                              |
                  | data[199].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[199].is_smart_asset    | 1                                                                            |
                  | data[199].asset_type_id     | 1                                                                            |

                  | data[200].name              | AssetTest1                                                                   |
                  | data[200].description       | description1                                                                 |
                  | data[200].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[200].is_active         | 1                                                                            |
                  | data[200].is_autoapprove    | 1                                                                            |
                  | data[200].price             | 50000                                                                        |
                  | data[200].qrcodeenable      | 1                                                                            |
                  | data[200].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[200].reasonform_id     |                                                                              |
                  | data[200].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[200].is_smart_asset    | 1                                                                            |
                  | data[200].asset_type_id     | 1                                                                            |

                  | data[201].name              | AssetTest1                                                                   |
                  | data[201].description       | description1                                                                 |
                  | data[201].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[201].is_active         | 1                                                                            |
                  | data[201].is_autoapprove    | 1                                                                            |
                  | data[201].price             | 50000                                                                        |
                  | data[201].qrcodeenable      | 1                                                                            |
                  | data[201].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[201].reasonform_id     |                                                                              |
                  | data[201].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[201].is_smart_asset    | 1                                                                            |
                  | data[201].asset_type_id     | 1                                                                            |

                  | data[202].name              | AssetTest1                                                                   |
                  | data[202].description       | description1                                                                 |
                  | data[202].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[202].is_active         | 1                                                                            |
                  | data[202].is_autoapprove    | 1                                                                            |
                  | data[202].price             | 50000                                                                        |
                  | data[202].qrcodeenable      | 1                                                                            |
                  | data[202].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[202].reasonform_id     |                                                                              |
                  | data[202].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[202].is_smart_asset    | 1                                                                            |
                  | data[202].asset_type_id     | 1                                                                            |

                  | data[203].name              | AssetTest1                                                                   |
                  | data[203].description       | description1                                                                 |
                  | data[203].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[203].is_active         | 1                                                                            |
                  | data[203].is_autoapprove    | 1                                                                            |
                  | data[203].price             | 50000                                                                        |
                  | data[203].qrcodeenable      | 1                                                                            |
                  | data[203].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[203].reasonform_id     |                                                                              |
                  | data[203].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[203].is_smart_asset    | 1                                                                            |
                  | data[203].asset_type_id     | 1                                                                            |

                  | data[204].name              | AssetTest1                                                                   |
                  | data[204].description       | description1                                                                 |
                  | data[204].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[204].is_active         | 1                                                                            |
                  | data[204].is_autoapprove    | 1                                                                            |
                  | data[204].price             | 50000                                                                        |
                  | data[204].qrcodeenable      | 1                                                                            |
                  | data[204].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[204].reasonform_id     |                                                                              |
                  | data[204].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[204].is_smart_asset    | 1                                                                            |
                  | data[204].asset_type_id     | 1                                                                            |

                  | data[205].name              | AssetTest1                                                                   |
                  | data[205].description       | description1                                                                 |
                  | data[205].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[205].is_active         | 1                                                                            |
                  | data[205].is_autoapprove    | 1                                                                            |
                  | data[205].price             | 50000                                                                        |
                  | data[205].qrcodeenable      | 1                                                                            |
                  | data[205].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[205].reasonform_id     |                                                                              |
                  | data[205].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[205].is_smart_asset    | 1                                                                            |
                  | data[205].asset_type_id     | 1                                                                            |

                  | data[206].name              | AssetTest1                                                                   |
                  | data[206].description       | description1                                                                 |
                  | data[206].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[206].is_active         | 1                                                                            |
                  | data[206].is_autoapprove    | 1                                                                            |
                  | data[206].price             | 50000                                                                        |
                  | data[206].qrcodeenable      | 1                                                                            |
                  | data[206].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[206].reasonform_id     |                                                                              |
                  | data[206].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[206].is_smart_asset    | 1                                                                            |
                  | data[206].asset_type_id     | 1                                                                            |

                  | data[207].name              | AssetTest1                                                                   |
                  | data[207].description       | description1                                                                 |
                  | data[207].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[207].is_active         | 1                                                                            |
                  | data[207].is_autoapprove    | 1                                                                            |
                  | data[207].price             | 50000                                                                        |
                  | data[207].qrcodeenable      | 1                                                                            |
                  | data[207].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[207].reasonform_id     |                                                                              |
                  | data[207].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[207].is_smart_asset    | 1                                                                            |
                  | data[207].asset_type_id     | 1                                                                            |

                  | data[208].name              | AssetTest1                                                                   |
                  | data[208].description       | description1                                                                 |
                  | data[208].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[208].is_active         | 1                                                                            |
                  | data[208].is_autoapprove    | 1                                                                            |
                  | data[208].price             | 50000                                                                        |
                  | data[208].qrcodeenable      | 1                                                                            |
                  | data[208].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[208].reasonform_id     |                                                                              |
                  | data[208].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[208].is_smart_asset    | 1                                                                            |
                  | data[208].asset_type_id     | 1                                                                            |

                  | data[209].name              | AssetTest1                                                                   |
                  | data[209].description       | description1                                                                 |
                  | data[209].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[209].is_active         | 1                                                                            |
                  | data[209].is_autoapprove    | 1                                                                            |
                  | data[209].price             | 50000                                                                        |
                  | data[209].qrcodeenable      | 1                                                                            |
                  | data[209].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[209].reasonform_id     |                                                                              |
                  | data[209].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[209].is_smart_asset    | 1                                                                            |
                  | data[209].asset_type_id     | 1                                                                            |

                  | data[210].name              | AssetTest1                                                                   |
                  | data[210].description       | description1                                                                 |
                  | data[210].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[210].is_active         | 1                                                                            |
                  | data[210].is_autoapprove    | 1                                                                            |
                  | data[210].price             | 50000                                                                        |
                  | data[210].qrcodeenable      | 1                                                                            |
                  | data[210].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[210].reasonform_id     |                                                                              |
                  | data[210].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[210].is_smart_asset    | 1                                                                            |
                  | data[210].asset_type_id     | 1                                                                            |

                  | data[211].name              | AssetTest1                                                                   |
                  | data[211].description       | description1                                                                 |
                  | data[211].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[211].is_active         | 1                                                                            |
                  | data[211].is_autoapprove    | 1                                                                            |
                  | data[211].price             | 50000                                                                        |
                  | data[211].qrcodeenable      | 1                                                                            |
                  | data[211].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[211].reasonform_id     |                                                                              |
                  | data[211].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[211].is_smart_asset    | 1                                                                            |
                  | data[211].asset_type_id     | 1                                                                            |

                  | data[212].name              | AssetTest1                                                                   |
                  | data[212].description       | description1                                                                 |
                  | data[212].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[212].is_active         | 1                                                                            |
                  | data[212].is_autoapprove    | 1                                                                            |
                  | data[212].price             | 50000                                                                        |
                  | data[212].qrcodeenable      | 1                                                                            |
                  | data[212].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[212].reasonform_id     |                                                                              |
                  | data[212].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[212].is_smart_asset    | 1                                                                            |
                  | data[212].asset_type_id     | 1                                                                            |

                  | data[213].name              | AssetTest1                                                                   |
                  | data[213].description       | description1                                                                 |
                  | data[213].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[213].is_active         | 1                                                                            |
                  | data[213].is_autoapprove    | 1                                                                            |
                  | data[213].price             | 50000                                                                        |
                  | data[213].qrcodeenable      | 1                                                                            |
                  | data[213].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[213].reasonform_id     |                                                                              |
                  | data[213].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[213].is_smart_asset    | 1                                                                            |
                  | data[213].asset_type_id     | 1                                                                            |

                  | data[214].name              | AssetTest1                                                                   |
                  | data[214].description       | description1                                                                 |
                  | data[214].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[214].is_active         | 1                                                                            |
                  | data[214].is_autoapprove    | 1                                                                            |
                  | data[214].price             | 50000                                                                        |
                  | data[214].qrcodeenable      | 1                                                                            |
                  | data[214].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[214].reasonform_id     |                                                                              |
                  | data[214].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[214].is_smart_asset    | 1                                                                            |
                  | data[214].asset_type_id     | 1                                                                            |

                  | data[215].name              | AssetTest1                                                                   |
                  | data[215].description       | description1                                                                 |
                  | data[215].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[215].is_active         | 1                                                                            |
                  | data[215].is_autoapprove    | 1                                                                            |
                  | data[215].price             | 50000                                                                        |
                  | data[215].qrcodeenable      | 1                                                                            |
                  | data[215].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[215].reasonform_id     |                                                                              |
                  | data[215].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[215].is_smart_asset    | 1                                                                            |
                  | data[215].asset_type_id     | 1                                                                            |

                  | data[216].name              | AssetTest1                                                                   |
                  | data[216].description       | description1                                                                 |
                  | data[216].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[216].is_active         | 1                                                                            |
                  | data[216].is_autoapprove    | 1                                                                            |
                  | data[216].price             | 50000                                                                        |
                  | data[216].qrcodeenable      | 1                                                                            |
                  | data[216].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[216].reasonform_id     |                                                                              |
                  | data[216].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[216].is_smart_asset    | 1                                                                            |
                  | data[216].asset_type_id     | 1                                                                            |

                  | data[217].name              | AssetTest1                                                                   |
                  | data[217].description       | description1                                                                 |
                  | data[217].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[217].is_active         | 1                                                                            |
                  | data[217].is_autoapprove    | 1                                                                            |
                  | data[217].price             | 50000                                                                        |
                  | data[217].qrcodeenable      | 1                                                                            |
                  | data[217].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[217].reasonform_id     |                                                                              |
                  | data[217].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[217].is_smart_asset    | 1                                                                            |
                  | data[217].asset_type_id     | 1                                                                            |

                  | data[218].name              | AssetTest1                                                                   |
                  | data[218].description       | description1                                                                 |
                  | data[218].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[218].is_active         | 1                                                                            |
                  | data[218].is_autoapprove    | 1                                                                            |
                  | data[218].price             | 50000                                                                        |
                  | data[218].qrcodeenable      | 1                                                                            |
                  | data[218].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[218].reasonform_id     |                                                                              |
                  | data[218].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[218].is_smart_asset    | 1                                                                            |
                  | data[218].asset_type_id     | 1                                                                            |

                  | data[219].name              | AssetTest1                                                                   |
                  | data[219].description       | description1                                                                 |
                  | data[219].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[219].is_active         | 1                                                                            |
                  | data[219].is_autoapprove    | 1                                                                            |
                  | data[219].price             | 50000                                                                        |
                  | data[219].qrcodeenable      | 1                                                                            |
                  | data[219].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[219].reasonform_id     |                                                                              |
                  | data[219].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[219].is_smart_asset    | 1                                                                            |
                  | data[219].asset_type_id     | 1                                                                            |

                  | data[220].name              | AssetTest1                                                                   |
                  | data[220].description       | description1                                                                 |
                  | data[220].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[220].is_active         | 1                                                                            |
                  | data[220].is_autoapprove    | 1                                                                            |
                  | data[220].price             | 50000                                                                        |
                  | data[220].qrcodeenable      | 1                                                                            |
                  | data[220].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[220].reasonform_id     |                                                                              |
                  | data[220].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[220].is_smart_asset    | 1                                                                            |
                  | data[220].asset_type_id     | 1                                                                            |

                  | data[221].name              | AssetTest1                                                                   |
                  | data[221].description       | description1                                                                 |
                  | data[221].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[221].is_active         | 1                                                                            |
                  | data[221].is_autoapprove    | 1                                                                            |
                  | data[221].price             | 50000                                                                        |
                  | data[221].qrcodeenable      | 1                                                                            |
                  | data[221].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[221].reasonform_id     |                                                                              |
                  | data[221].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[221].is_smart_asset    | 1                                                                            |
                  | data[221].asset_type_id     | 1                                                                            |

                  | data[222].name              | AssetTest1                                                                   |
                  | data[222].description       | description1                                                                 |
                  | data[222].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[222].is_active         | 1                                                                            |
                  | data[222].is_autoapprove    | 1                                                                            |
                  | data[222].price             | 50000                                                                        |
                  | data[222].qrcodeenable      | 1                                                                            |
                  | data[222].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[222].reasonform_id     |                                                                              |
                  | data[222].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[222].is_smart_asset    | 1                                                                            |
                  | data[222].asset_type_id     | 1                                                                            |

                  | data[223].name              | AssetTest1                                                                   |
                  | data[223].description       | description1                                                                 |
                  | data[223].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[223].is_active         | 1                                                                            |
                  | data[223].is_autoapprove    | 1                                                                            |
                  | data[223].price             | 50000                                                                        |
                  | data[223].qrcodeenable      | 1                                                                            |
                  | data[223].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[223].reasonform_id     |                                                                              |
                  | data[223].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[223].is_smart_asset    | 1                                                                            |
                  | data[223].asset_type_id     | 1                                                                            |

                  | data[224].name              | AssetTest1                                                                   |
                  | data[224].description       | description1                                                                 |
                  | data[224].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[224].is_active         | 1                                                                            |
                  | data[224].is_autoapprove    | 1                                                                            |
                  | data[224].price             | 50000                                                                        |
                  | data[224].qrcodeenable      | 1                                                                            |
                  | data[224].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[224].reasonform_id     |                                                                              |
                  | data[224].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[224].is_smart_asset    | 1                                                                            |
                  | data[224].asset_type_id     | 1                                                                            |

                  | data[225].name              | AssetTest1                                                                   |
                  | data[225].description       | description1                                                                 |
                  | data[225].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[225].is_active         | 1                                                                            |
                  | data[225].is_autoapprove    | 1                                                                            |
                  | data[225].price             | 50000                                                                        |
                  | data[225].qrcodeenable      | 1                                                                            |
                  | data[225].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[225].reasonform_id     |                                                                              |
                  | data[225].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[225].is_smart_asset    | 1                                                                            |
                  | data[225].asset_type_id     | 1                                                                            |

                  | data[226].name              | AssetTest1                                                                   |
                  | data[226].description       | description1                                                                 |
                  | data[226].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[226].is_active         | 1                                                                            |
                  | data[226].is_autoapprove    | 1                                                                            |
                  | data[226].price             | 50000                                                                        |
                  | data[226].qrcodeenable      | 1                                                                            |
                  | data[226].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[226].reasonform_id     |                                                                              |
                  | data[226].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[226].is_smart_asset    | 1                                                                            |
                  | data[226].asset_type_id     | 1                                                                            |

                  | data[227].name              | AssetTest1                                                                   |
                  | data[227].description       | description1                                                                 |
                  | data[227].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[227].is_active         | 1                                                                            |
                  | data[227].is_autoapprove    | 1                                                                            |
                  | data[227].price             | 50000                                                                        |
                  | data[227].qrcodeenable      | 1                                                                            |
                  | data[227].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[227].reasonform_id     |                                                                              |
                  | data[227].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[227].is_smart_asset    | 1                                                                            |
                  | data[227].asset_type_id     | 1                                                                            |

                  | data[228].name              | AssetTest1                                                                   |
                  | data[228].description       | description1                                                                 |
                  | data[228].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[228].is_active         | 1                                                                            |
                  | data[228].is_autoapprove    | 1                                                                            |
                  | data[228].price             | 50000                                                                        |
                  | data[228].qrcodeenable      | 1                                                                            |
                  | data[228].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[228].reasonform_id     |                                                                              |
                  | data[228].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[228].is_smart_asset    | 1                                                                            |
                  | data[228].asset_type_id     | 1                                                                            |

                  | data[229].name              | AssetTest1                                                                   |
                  | data[229].description       | description1                                                                 |
                  | data[229].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[229].is_active         | 1                                                                            |
                  | data[229].is_autoapprove    | 1                                                                            |
                  | data[229].price             | 50000                                                                        |
                  | data[229].qrcodeenable      | 1                                                                            |
                  | data[229].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[229].reasonform_id     |                                                                              |
                  | data[229].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[229].is_smart_asset    | 1                                                                            |
                  | data[229].asset_type_id     | 1                                                                            |

                  | data[230].name              | AssetTest1                                                                   |
                  | data[230].description       | description1                                                                 |
                  | data[230].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[230].is_active         | 1                                                                            |
                  | data[230].is_autoapprove    | 1                                                                            |
                  | data[230].price             | 50000                                                                        |
                  | data[230].qrcodeenable      | 1                                                                            |
                  | data[230].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[230].reasonform_id     |                                                                              |
                  | data[230].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[230].is_smart_asset    | 1                                                                            |
                  | data[230].asset_type_id     | 1                                                                            |

                  | data[231].name              | AssetTest1                                                                   |
                  | data[231].description       | description1                                                                 |
                  | data[231].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[231].is_active         | 1                                                                            |
                  | data[231].is_autoapprove    | 1                                                                            |
                  | data[231].price             | 50000                                                                        |
                  | data[231].qrcodeenable      | 1                                                                            |
                  | data[231].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[231].reasonform_id     |                                                                              |
                  | data[231].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[231].is_smart_asset    | 1                                                                            |
                  | data[231].asset_type_id     | 1                                                                            |

                  | data[232].name              | AssetTest1                                                                   |
                  | data[232].description       | description1                                                                 |
                  | data[232].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[232].is_active         | 1                                                                            |
                  | data[232].is_autoapprove    | 1                                                                            |
                  | data[232].price             | 50000                                                                        |
                  | data[232].qrcodeenable      | 1                                                                            |
                  | data[232].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[232].reasonform_id     |                                                                              |
                  | data[232].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[232].is_smart_asset    | 1                                                                            |
                  | data[232].asset_type_id     | 1                                                                            |

                  | data[233].name              | AssetTest1                                                                   |
                  | data[233].description       | description1                                                                 |
                  | data[233].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[233].is_active         | 1                                                                            |
                  | data[233].is_autoapprove    | 1                                                                            |
                  | data[233].price             | 50000                                                                        |
                  | data[233].qrcodeenable      | 1                                                                            |
                  | data[233].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[233].reasonform_id     |                                                                              |
                  | data[233].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[233].is_smart_asset    | 1                                                                            |
                  | data[233].asset_type_id     | 1                                                                            |

                  | data[234].name              | AssetTest1                                                                   |
                  | data[234].description       | description1                                                                 |
                  | data[234].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[234].is_active         | 1                                                                            |
                  | data[234].is_autoapprove    | 1                                                                            |
                  | data[234].price             | 50000                                                                        |
                  | data[234].qrcodeenable      | 1                                                                            |
                  | data[234].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[234].reasonform_id     |                                                                              |
                  | data[234].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[234].is_smart_asset    | 1                                                                            |
                  | data[234].asset_type_id     | 1                                                                            |

                  | data[235].name              | AssetTest1                                                                   |
                  | data[235].description       | description1                                                                 |
                  | data[235].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[235].is_active         | 1                                                                            |
                  | data[235].is_autoapprove    | 1                                                                            |
                  | data[235].price             | 50000                                                                        |
                  | data[235].qrcodeenable      | 1                                                                            |
                  | data[235].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[235].reasonform_id     |                                                                              |
                  | data[235].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[235].is_smart_asset    | 1                                                                            |
                  | data[235].asset_type_id     | 1                                                                            |

                  | data[236].name              | AssetTest1                                                                   |
                  | data[236].description       | description1                                                                 |
                  | data[236].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[236].is_active         | 1                                                                            |
                  | data[236].is_autoapprove    | 1                                                                            |
                  | data[236].price             | 50000                                                                        |
                  | data[236].qrcodeenable      | 1                                                                            |
                  | data[236].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[236].reasonform_id     |                                                                              |
                  | data[236].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[236].is_smart_asset    | 1                                                                            |
                  | data[236].asset_type_id     | 1                                                                            |

                  | data[237].name              | AssetTest1                                                                   |
                  | data[237].description       | description1                                                                 |
                  | data[237].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[237].is_active         | 1                                                                            |
                  | data[237].is_autoapprove    | 1                                                                            |
                  | data[237].price             | 50000                                                                        |
                  | data[237].qrcodeenable      | 1                                                                            |
                  | data[237].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[237].reasonform_id     |                                                                              |
                  | data[237].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[237].is_smart_asset    | 1                                                                            |
                  | data[237].asset_type_id     | 1                                                                            |

                  | data[238].name              | AssetTest1                                                                   |
                  | data[238].description       | description1                                                                 |
                  | data[238].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[238].is_active         | 1                                                                            |
                  | data[238].is_autoapprove    | 1                                                                            |
                  | data[238].price             | 50000                                                                        |
                  | data[238].qrcodeenable      | 1                                                                            |
                  | data[238].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[238].reasonform_id     |                                                                              |
                  | data[238].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[238].is_smart_asset    | 1                                                                            |
                  | data[238].asset_type_id     | 1                                                                            |

                  | data[239].name              | AssetTest1                                                                   |
                  | data[239].description       | description1                                                                 |
                  | data[239].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[239].is_active         | 1                                                                            |
                  | data[239].is_autoapprove    | 1                                                                            |
                  | data[239].price             | 50000                                                                        |
                  | data[239].qrcodeenable      | 1                                                                            |
                  | data[239].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[239].reasonform_id     |                                                                              |
                  | data[239].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[239].is_smart_asset    | 1                                                                            |
                  | data[239].asset_type_id     | 1                                                                            |

                  | data[240].name              | AssetTest1                                                                   |
                  | data[240].description       | description1                                                                 |
                  | data[240].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[240].is_active         | 1                                                                            |
                  | data[240].is_autoapprove    | 1                                                                            |
                  | data[240].price             | 50000                                                                        |
                  | data[240].qrcodeenable      | 1                                                                            |
                  | data[240].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[240].reasonform_id     |                                                                              |
                  | data[240].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[240].is_smart_asset    | 1                                                                            |
                  | data[240].asset_type_id     | 1                                                                            |

                  | data[241].name              | AssetTest1                                                                   |
                  | data[241].description       | description1                                                                 |
                  | data[241].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[241].is_active         | 1                                                                            |
                  | data[241].is_autoapprove    | 1                                                                            |
                  | data[241].price             | 50000                                                                        |
                  | data[241].qrcodeenable      | 1                                                                            |
                  | data[241].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[241].reasonform_id     |                                                                              |
                  | data[241].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[241].is_smart_asset    | 1                                                                            |
                  | data[241].asset_type_id     | 1                                                                            |

                  | data[242].name              | AssetTest1                                                                   |
                  | data[242].description       | description1                                                                 |
                  | data[242].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[242].is_active         | 1                                                                            |
                  | data[242].is_autoapprove    | 1                                                                            |
                  | data[242].price             | 50000                                                                        |
                  | data[242].qrcodeenable      | 1                                                                            |
                  | data[242].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[242].reasonform_id     |                                                                              |
                  | data[242].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[242].is_smart_asset    | 1                                                                            |
                  | data[242].asset_type_id     | 1                                                                            |

                  | data[243].name              | AssetTest1                                                                   |
                  | data[243].description       | description1                                                                 |
                  | data[243].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[243].is_active         | 1                                                                            |
                  | data[243].is_autoapprove    | 1                                                                            |
                  | data[243].price             | 50000                                                                        |
                  | data[243].qrcodeenable      | 1                                                                            |
                  | data[243].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[243].reasonform_id     |                                                                              |
                  | data[243].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[243].is_smart_asset    | 1                                                                            |
                  | data[243].asset_type_id     | 1                                                                            |

                  | data[244].name              | AssetTest1                                                                   |
                  | data[244].description       | description1                                                                 |
                  | data[244].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[244].is_active         | 1                                                                            |
                  | data[244].is_autoapprove    | 1                                                                            |
                  | data[244].price             | 50000                                                                        |
                  | data[244].qrcodeenable      | 1                                                                            |
                  | data[244].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[244].reasonform_id     |                                                                              |
                  | data[244].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[244].is_smart_asset    | 1                                                                            |
                  | data[244].asset_type_id     | 1                                                                            |

                  | data[245].name              | AssetTest1                                                                   |
                  | data[245].description       | description1                                                                 |
                  | data[245].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[245].is_active         | 1                                                                            |
                  | data[245].is_autoapprove    | 1                                                                            |
                  | data[245].price             | 50000                                                                        |
                  | data[245].qrcodeenable      | 1                                                                            |
                  | data[245].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[245].reasonform_id     |                                                                              |
                  | data[245].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[245].is_smart_asset    | 1                                                                            |
                  | data[245].asset_type_id     | 1                                                                            |

                  | data[246].name              | AssetTest1                                                                   |
                  | data[246].description       | description1                                                                 |
                  | data[246].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[246].is_active         | 1                                                                            |
                  | data[246].is_autoapprove    | 1                                                                            |
                  | data[246].price             | 50000                                                                        |
                  | data[246].qrcodeenable      | 1                                                                            |
                  | data[246].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[246].reasonform_id     |                                                                              |
                  | data[246].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[246].is_smart_asset    | 1                                                                            |
                  | data[246].asset_type_id     | 1                                                                            |

                  | data[247].name              | AssetTest1                                                                   |
                  | data[247].description       | description1                                                                 |
                  | data[247].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[247].is_active         | 1                                                                            |
                  | data[247].is_autoapprove    | 1                                                                            |
                  | data[247].price             | 50000                                                                        |
                  | data[247].qrcodeenable      | 1                                                                            |
                  | data[247].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[247].reasonform_id     |                                                                              |
                  | data[247].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[247].is_smart_asset    | 1                                                                            |
                  | data[247].asset_type_id     | 1                                                                            |

                  | data[248].name              | AssetTest1                                                                   |
                  | data[248].description       | description1                                                                 |
                  | data[248].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[248].is_active         | 1                                                                            |
                  | data[248].is_autoapprove    | 1                                                                            |
                  | data[248].price             | 50000                                                                        |
                  | data[248].qrcodeenable      | 1                                                                            |
                  | data[248].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[248].reasonform_id     |                                                                              |
                  | data[248].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[248].is_smart_asset    | 1                                                                            |
                  | data[248].asset_type_id     | 1                                                                            |

                  | data[249].name              | AssetTest1                                                                   |
                  | data[249].description       | description1                                                                 |
                  | data[249].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[249].is_active         | 1                                                                            |
                  | data[249].is_autoapprove    | 1                                                                            |
                  | data[249].price             | 50000                                                                        |
                  | data[249].qrcodeenable      | 1                                                                            |
                  | data[249].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[249].reasonform_id     |                                                                              |
                  | data[249].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[249].is_smart_asset    | 1                                                                            |
                  | data[249].asset_type_id     | 1                                                                            |

                  | data[250].name              | AssetTest1                                                                   |
                  | data[250].description       | description1                                                                 |
                  | data[250].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[250].is_active         | 1                                                                            |
                  | data[250].is_autoapprove    | 1                                                                            |
                  | data[250].price             | 50000                                                                        |
                  | data[250].qrcodeenable      | 1                                                                            |
                  | data[250].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[250].reasonform_id     |                                                                              |
                  | data[250].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[250].is_smart_asset    | 1                                                                            |
                  | data[250].asset_type_id     | 1                                                                            |

                  | data[251].name              | AssetTest1                                                                   |
                  | data[251].description       | description1                                                                 |
                  | data[251].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[251].is_active         | 1                                                                            |
                  | data[251].is_autoapprove    | 1                                                                            |
                  | data[251].price             | 50000                                                                        |
                  | data[251].qrcodeenable      | 1                                                                            |
                  | data[251].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[251].reasonform_id     |                                                                              |
                  | data[251].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[251].is_smart_asset    | 1                                                                            |
                  | data[251].asset_type_id     | 1                                                                            |

                  | data[252].name              | AssetTest1                                                                   |
                  | data[252].description       | description1                                                                 |
                  | data[252].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[252].is_active         | 1                                                                            |
                  | data[252].is_autoapprove    | 1                                                                            |
                  | data[252].price             | 50000                                                                        |
                  | data[252].qrcodeenable      | 1                                                                            |
                  | data[252].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[252].reasonform_id     |                                                                              |
                  | data[252].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[252].is_smart_asset    | 1                                                                            |
                  | data[252].asset_type_id     | 1                                                                            |

                  | data[253].name              | AssetTest1                                                                   |
                  | data[253].description       | description1                                                                 |
                  | data[253].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[253].is_active         | 1                                                                            |
                  | data[253].is_autoapprove    | 1                                                                            |
                  | data[253].price             | 50000                                                                        |
                  | data[253].qrcodeenable      | 1                                                                            |
                  | data[253].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[253].reasonform_id     |                                                                              |
                  | data[253].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[253].is_smart_asset    | 1                                                                            |
                  | data[253].asset_type_id     | 1                                                                            |

                  | data[254].name              | AssetTest1                                                                   |
                  | data[254].description       | description1                                                                 |
                  | data[254].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[254].is_active         | 1                                                                            |
                  | data[254].is_autoapprove    | 1                                                                            |
                  | data[254].price             | 50000                                                                        |
                  | data[254].qrcodeenable      | 1                                                                            |
                  | data[254].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[254].reasonform_id     |                                                                              |
                  | data[254].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[254].is_smart_asset    | 1                                                                            |
                  | data[254].asset_type_id     | 1                                                                            |

                  | data[255].name              | AssetTest1                                                                   |
                  | data[255].description       | description1                                                                 |
                  | data[255].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[255].is_active         | 1                                                                            |
                  | data[255].is_autoapprove    | 1                                                                            |
                  | data[255].price             | 50000                                                                        |
                  | data[255].qrcodeenable      | 1                                                                            |
                  | data[255].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[255].reasonform_id     |                                                                              |
                  | data[255].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[255].is_smart_asset    | 1                                                                            |
                  | data[255].asset_type_id     | 1                                                                            |

                  | data[256].name              | AssetTest1                                                                   |
                  | data[256].description       | description1                                                                 |
                  | data[256].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[256].is_active         | 1                                                                            |
                  | data[256].is_autoapprove    | 1                                                                            |
                  | data[256].price             | 50000                                                                        |
                  | data[256].qrcodeenable      | 1                                                                            |
                  | data[256].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[256].reasonform_id     |                                                                              |
                  | data[256].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[256].is_smart_asset    | 1                                                                            |
                  | data[256].asset_type_id     | 1                                                                            |

                  | data[257].name              | AssetTest1                                                                   |
                  | data[257].description       | description1                                                                 |
                  | data[257].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[257].is_active         | 1                                                                            |
                  | data[257].is_autoapprove    | 1                                                                            |
                  | data[257].price             | 50000                                                                        |
                  | data[257].qrcodeenable      | 1                                                                            |
                  | data[257].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[257].reasonform_id     |                                                                              |
                  | data[257].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[257].is_smart_asset    | 1                                                                            |
                  | data[257].asset_type_id     | 1                                                                            |

                  | data[258].name              | AssetTest1                                                                   |
                  | data[258].description       | description1                                                                 |
                  | data[258].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[258].is_active         | 1                                                                            |
                  | data[258].is_autoapprove    | 1                                                                            |
                  | data[258].price             | 50000                                                                        |
                  | data[258].qrcodeenable      | 1                                                                            |
                  | data[258].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[258].reasonform_id     |                                                                              |
                  | data[258].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[258].is_smart_asset    | 1                                                                            |
                  | data[258].asset_type_id     | 1                                                                            |

                  | data[259].name              | AssetTest1                                                                   |
                  | data[259].description       | description1                                                                 |
                  | data[259].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[259].is_active         | 1                                                                            |
                  | data[259].is_autoapprove    | 1                                                                            |
                  | data[259].price             | 50000                                                                        |
                  | data[259].qrcodeenable      | 1                                                                            |
                  | data[259].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[259].reasonform_id     |                                                                              |
                  | data[259].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[259].is_smart_asset    | 1                                                                            |
                  | data[259].asset_type_id     | 1                                                                            |

                  | data[260].name              | AssetTest1                                                                   |
                  | data[260].description       | description1                                                                 |
                  | data[260].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[260].is_active         | 1                                                                            |
                  | data[260].is_autoapprove    | 1                                                                            |
                  | data[260].price             | 50000                                                                        |
                  | data[260].qrcodeenable      | 1                                                                            |
                  | data[260].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[260].reasonform_id     |                                                                              |
                  | data[260].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[260].is_smart_asset    | 1                                                                            |
                  | data[260].asset_type_id     | 1                                                                            |

                  | data[261].name              | AssetTest1                                                                   |
                  | data[261].description       | description1                                                                 |
                  | data[261].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[261].is_active         | 1                                                                            |
                  | data[261].is_autoapprove    | 1                                                                            |
                  | data[261].price             | 50000                                                                        |
                  | data[261].qrcodeenable      | 1                                                                            |
                  | data[261].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[261].reasonform_id     |                                                                              |
                  | data[261].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[261].is_smart_asset    | 1                                                                            |
                  | data[261].asset_type_id     | 1                                                                            |

                  | data[262].name              | AssetTest1                                                                   |
                  | data[262].description       | description1                                                                 |
                  | data[262].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[262].is_active         | 1                                                                            |
                  | data[262].is_autoapprove    | 1                                                                            |
                  | data[262].price             | 50000                                                                        |
                  | data[262].qrcodeenable      | 1                                                                            |
                  | data[262].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[262].reasonform_id     |                                                                              |
                  | data[262].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[262].is_smart_asset    | 1                                                                            |
                  | data[262].asset_type_id     | 1                                                                            |

                  | data[263].name              | AssetTest1                                                                   |
                  | data[263].description       | description1                                                                 |
                  | data[263].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[263].is_active         | 1                                                                            |
                  | data[263].is_autoapprove    | 1                                                                            |
                  | data[263].price             | 50000                                                                        |
                  | data[263].qrcodeenable      | 1                                                                            |
                  | data[263].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[263].reasonform_id     |                                                                              |
                  | data[263].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[263].is_smart_asset    | 1                                                                            |
                  | data[263].asset_type_id     | 1                                                                            |

                  | data[264].name              | AssetTest1                                                                   |
                  | data[264].description       | description1                                                                 |
                  | data[264].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[264].is_active         | 1                                                                            |
                  | data[264].is_autoapprove    | 1                                                                            |
                  | data[264].price             | 50000                                                                        |
                  | data[264].qrcodeenable      | 1                                                                            |
                  | data[264].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[264].reasonform_id     |                                                                              |
                  | data[264].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[264].is_smart_asset    | 1                                                                            |
                  | data[264].asset_type_id     | 1                                                                            |

                  | data[265].name              | AssetTest1                                                                   |
                  | data[265].description       | description1                                                                 |
                  | data[265].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[265].is_active         | 1                                                                            |
                  | data[265].is_autoapprove    | 1                                                                            |
                  | data[265].price             | 50000                                                                        |
                  | data[265].qrcodeenable      | 1                                                                            |
                  | data[265].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[265].reasonform_id     |                                                                              |
                  | data[265].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[265].is_smart_asset    | 1                                                                            |
                  | data[265].asset_type_id     | 1                                                                            |

                  | data[266].name              | AssetTest1                                                                   |
                  | data[266].description       | description1                                                                 |
                  | data[266].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[266].is_active         | 1                                                                            |
                  | data[266].is_autoapprove    | 1                                                                            |
                  | data[266].price             | 50000                                                                        |
                  | data[266].qrcodeenable      | 1                                                                            |
                  | data[266].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[266].reasonform_id     |                                                                              |
                  | data[266].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[266].is_smart_asset    | 1                                                                            |
                  | data[266].asset_type_id     | 1                                                                            |

                  | data[267].name              | AssetTest1                                                                   |
                  | data[267].description       | description1                                                                 |
                  | data[267].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[267].is_active         | 1                                                                            |
                  | data[267].is_autoapprove    | 1                                                                            |
                  | data[267].price             | 50000                                                                        |
                  | data[267].qrcodeenable      | 1                                                                            |
                  | data[267].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[267].reasonform_id     |                                                                              |
                  | data[267].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[267].is_smart_asset    | 1                                                                            |
                  | data[267].asset_type_id     | 1                                                                            |

                  | data[268].name              | AssetTest1                                                                   |
                  | data[268].description       | description1                                                                 |
                  | data[268].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[268].is_active         | 1                                                                            |
                  | data[268].is_autoapprove    | 1                                                                            |
                  | data[268].price             | 50000                                                                        |
                  | data[268].qrcodeenable      | 1                                                                            |
                  | data[268].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[268].reasonform_id     |                                                                              |
                  | data[268].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[268].is_smart_asset    | 1                                                                            |
                  | data[268].asset_type_id     | 1                                                                            |

                  | data[269].name              | AssetTest1                                                                   |
                  | data[269].description       | description1                                                                 |
                  | data[269].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[269].is_active         | 1                                                                            |
                  | data[269].is_autoapprove    | 1                                                                            |
                  | data[269].price             | 50000                                                                        |
                  | data[269].qrcodeenable      | 1                                                                            |
                  | data[269].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[269].reasonform_id     |                                                                              |
                  | data[269].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[269].is_smart_asset    | 1                                                                            |
                  | data[269].asset_type_id     | 1                                                                            |

                  | data[270].name              | AssetTest1                                                                   |
                  | data[270].description       | description1                                                                 |
                  | data[270].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[270].is_active         | 1                                                                            |
                  | data[270].is_autoapprove    | 1                                                                            |
                  | data[270].price             | 50000                                                                        |
                  | data[270].qrcodeenable      | 1                                                                            |
                  | data[270].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[270].reasonform_id     |                                                                              |
                  | data[270].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[270].is_smart_asset    | 1                                                                            |
                  | data[270].asset_type_id     | 1                                                                            |

                  | data[271].name              | AssetTest1                                                                   |
                  | data[271].description       | description1                                                                 |
                  | data[271].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[271].is_active         | 1                                                                            |
                  | data[271].is_autoapprove    | 1                                                                            |
                  | data[271].price             | 50000                                                                        |
                  | data[271].qrcodeenable      | 1                                                                            |
                  | data[271].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[271].reasonform_id     |                                                                              |
                  | data[271].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[271].is_smart_asset    | 1                                                                            |
                  | data[271].asset_type_id     | 1                                                                            |

                  | data[272].name              | AssetTest1                                                                   |
                  | data[272].description       | description1                                                                 |
                  | data[272].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[272].is_active         | 1                                                                            |
                  | data[272].is_autoapprove    | 1                                                                            |
                  | data[272].price             | 50000                                                                        |
                  | data[272].qrcodeenable      | 1                                                                            |
                  | data[272].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[272].reasonform_id     |                                                                              |
                  | data[272].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[272].is_smart_asset    | 1                                                                            |
                  | data[272].asset_type_id     | 1                                                                            |

                  | data[273].name              | AssetTest1                                                                   |
                  | data[273].description       | description1                                                                 |
                  | data[273].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[273].is_active         | 1                                                                            |
                  | data[273].is_autoapprove    | 1                                                                            |
                  | data[273].price             | 50000                                                                        |
                  | data[273].qrcodeenable      | 1                                                                            |
                  | data[273].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[273].reasonform_id     |                                                                              |
                  | data[273].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[273].is_smart_asset    | 1                                                                            |
                  | data[273].asset_type_id     | 1                                                                            |

                  | data[274].name              | AssetTest1                                                                   |
                  | data[274].description       | description1                                                                 |
                  | data[274].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[274].is_active         | 1                                                                            |
                  | data[274].is_autoapprove    | 1                                                                            |
                  | data[274].price             | 50000                                                                        |
                  | data[274].qrcodeenable      | 1                                                                            |
                  | data[274].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[274].reasonform_id     |                                                                              |
                  | data[274].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[274].is_smart_asset    | 1                                                                            |
                  | data[274].asset_type_id     | 1                                                                            |

                  | data[275].name              | AssetTest1                                                                   |
                  | data[275].description       | description1                                                                 |
                  | data[275].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[275].is_active         | 1                                                                            |
                  | data[275].is_autoapprove    | 1                                                                            |
                  | data[275].price             | 50000                                                                        |
                  | data[275].qrcodeenable      | 1                                                                            |
                  | data[275].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[275].reasonform_id     |                                                                              |
                  | data[275].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[275].is_smart_asset    | 1                                                                            |
                  | data[275].asset_type_id     | 1                                                                            |

                  | data[276].name              | AssetTest1                                                                   |
                  | data[276].description       | description1                                                                 |
                  | data[276].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[276].is_active         | 1                                                                            |
                  | data[276].is_autoapprove    | 1                                                                            |
                  | data[276].price             | 50000                                                                        |
                  | data[276].qrcodeenable      | 1                                                                            |
                  | data[276].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[276].reasonform_id     |                                                                              |
                  | data[276].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[276].is_smart_asset    | 1                                                                            |
                  | data[276].asset_type_id     | 1                                                                            |

                  | data[277].name              | AssetTest1                                                                   |
                  | data[277].description       | description1                                                                 |
                  | data[277].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[277].is_active         | 1                                                                            |
                  | data[277].is_autoapprove    | 1                                                                            |
                  | data[277].price             | 50000                                                                        |
                  | data[277].qrcodeenable      | 1                                                                            |
                  | data[277].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[277].reasonform_id     |                                                                              |
                  | data[277].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[277].is_smart_asset    | 1                                                                            |
                  | data[277].asset_type_id     | 1                                                                            |

                  | data[278].name              | AssetTest1                                                                   |
                  | data[278].description       | description1                                                                 |
                  | data[278].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[278].is_active         | 1                                                                            |
                  | data[278].is_autoapprove    | 1                                                                            |
                  | data[278].price             | 50000                                                                        |
                  | data[278].qrcodeenable      | 1                                                                            |
                  | data[278].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[278].reasonform_id     |                                                                              |
                  | data[278].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[278].is_smart_asset    | 1                                                                            |
                  | data[278].asset_type_id     | 1                                                                            |

                  | data[279].name              | AssetTest1                                                                   |
                  | data[279].description       | description1                                                                 |
                  | data[279].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[279].is_active         | 1                                                                            |
                  | data[279].is_autoapprove    | 1                                                                            |
                  | data[279].price             | 50000                                                                        |
                  | data[279].qrcodeenable      | 1                                                                            |
                  | data[279].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[279].reasonform_id     |                                                                              |
                  | data[279].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[279].is_smart_asset    | 1                                                                            |
                  | data[279].asset_type_id     | 1                                                                            |

                  | data[280].name              | AssetTest1                                                                   |
                  | data[280].description       | description1                                                                 |
                  | data[280].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[280].is_active         | 1                                                                            |
                  | data[280].is_autoapprove    | 1                                                                            |
                  | data[280].price             | 50000                                                                        |
                  | data[280].qrcodeenable      | 1                                                                            |
                  | data[280].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[280].reasonform_id     |                                                                              |
                  | data[280].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[280].is_smart_asset    | 1                                                                            |
                  | data[280].asset_type_id     | 1                                                                            |

                  | data[281].name              | AssetTest1                                                                   |
                  | data[281].description       | description1                                                                 |
                  | data[281].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[281].is_active         | 1                                                                            |
                  | data[281].is_autoapprove    | 1                                                                            |
                  | data[281].price             | 50000                                                                        |
                  | data[281].qrcodeenable      | 1                                                                            |
                  | data[281].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[281].reasonform_id     |                                                                              |
                  | data[281].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[281].is_smart_asset    | 1                                                                            |
                  | data[281].asset_type_id     | 1                                                                            |

                  | data[282].name              | AssetTest1                                                                   |
                  | data[282].description       | description1                                                                 |
                  | data[282].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[282].is_active         | 1                                                                            |
                  | data[282].is_autoapprove    | 1                                                                            |
                  | data[282].price             | 50000                                                                        |
                  | data[282].qrcodeenable      | 1                                                                            |
                  | data[282].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[282].reasonform_id     |                                                                              |
                  | data[282].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[282].is_smart_asset    | 1                                                                            |
                  | data[282].asset_type_id     | 1                                                                            |

                  | data[283].name              | AssetTest1                                                                   |
                  | data[283].description       | description1                                                                 |
                  | data[283].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[283].is_active         | 1                                                                            |
                  | data[283].is_autoapprove    | 1                                                                            |
                  | data[283].price             | 50000                                                                        |
                  | data[283].qrcodeenable      | 1                                                                            |
                  | data[283].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[283].reasonform_id     |                                                                              |
                  | data[283].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[283].is_smart_asset    | 1                                                                            |
                  | data[283].asset_type_id     | 1                                                                            |

                  | data[284].name              | AssetTest1                                                                   |
                  | data[284].description       | description1                                                                 |
                  | data[284].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[284].is_active         | 1                                                                            |
                  | data[284].is_autoapprove    | 1                                                                            |
                  | data[284].price             | 50000                                                                        |
                  | data[284].qrcodeenable      | 1                                                                            |
                  | data[284].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[284].reasonform_id     |                                                                              |
                  | data[284].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[284].is_smart_asset    | 1                                                                            |
                  | data[284].asset_type_id     | 1                                                                            |

                  | data[285].name              | AssetTest1                                                                   |
                  | data[285].description       | description1                                                                 |
                  | data[285].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[285].is_active         | 1                                                                            |
                  | data[285].is_autoapprove    | 1                                                                            |
                  | data[285].price             | 50000                                                                        |
                  | data[285].qrcodeenable      | 1                                                                            |
                  | data[285].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[285].reasonform_id     |                                                                              |
                  | data[285].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[285].is_smart_asset    | 1                                                                            |
                  | data[285].asset_type_id     | 1                                                                            |

                  | data[286].name              | AssetTest1                                                                   |
                  | data[286].description       | description1                                                                 |
                  | data[286].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[286].is_active         | 1                                                                            |
                  | data[286].is_autoapprove    | 1                                                                            |
                  | data[286].price             | 50000                                                                        |
                  | data[286].qrcodeenable      | 1                                                                            |
                  | data[286].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[286].reasonform_id     |                                                                              |
                  | data[286].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[286].is_smart_asset    | 1                                                                            |
                  | data[286].asset_type_id     | 1                                                                            |

                  | data[287].name              | AssetTest1                                                                   |
                  | data[287].description       | description1                                                                 |
                  | data[287].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[287].is_active         | 1                                                                            |
                  | data[287].is_autoapprove    | 1                                                                            |
                  | data[287].price             | 50000                                                                        |
                  | data[287].qrcodeenable      | 1                                                                            |
                  | data[287].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[287].reasonform_id     |                                                                              |
                  | data[287].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[287].is_smart_asset    | 1                                                                            |
                  | data[287].asset_type_id     | 1                                                                            |

                  | data[288].name              | AssetTest1                                                                   |
                  | data[288].description       | description1                                                                 |
                  | data[288].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[288].is_active         | 1                                                                            |
                  | data[288].is_autoapprove    | 1                                                                            |
                  | data[288].price             | 50000                                                                        |
                  | data[288].qrcodeenable      | 1                                                                            |
                  | data[288].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[288].reasonform_id     |                                                                              |
                  | data[288].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[288].is_smart_asset    | 1                                                                            |
                  | data[288].asset_type_id     | 1                                                                            |

                  | data[289].name              | AssetTest1                                                                   |
                  | data[289].description       | description1                                                                 |
                  | data[289].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[289].is_active         | 1                                                                            |
                  | data[289].is_autoapprove    | 1                                                                            |
                  | data[289].price             | 50000                                                                        |
                  | data[289].qrcodeenable      | 1                                                                            |
                  | data[289].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[289].reasonform_id     |                                                                              |
                  | data[289].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[289].is_smart_asset    | 1                                                                            |
                  | data[289].asset_type_id     | 1                                                                            |

                  | data[290].name              | AssetTest1                                                                   |
                  | data[290].description       | description1                                                                 |
                  | data[290].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[290].is_active         | 1                                                                            |
                  | data[290].is_autoapprove    | 1                                                                            |
                  | data[290].price             | 50000                                                                        |
                  | data[290].qrcodeenable      | 1                                                                            |
                  | data[290].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[290].reasonform_id     |                                                                              |
                  | data[290].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[290].is_smart_asset    | 1                                                                            |
                  | data[290].asset_type_id     | 1                                                                            |

                  | data[291].name              | AssetTest1                                                                   |
                  | data[291].description       | description1                                                                 |
                  | data[291].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[291].is_active         | 1                                                                            |
                  | data[291].is_autoapprove    | 1                                                                            |
                  | data[291].price             | 50000                                                                        |
                  | data[291].qrcodeenable      | 1                                                                            |
                  | data[291].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[291].reasonform_id     |                                                                              |
                  | data[291].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[291].is_smart_asset    | 1                                                                            |
                  | data[291].asset_type_id     | 1                                                                            |

                  | data[292].name              | AssetTest1                                                                   |
                  | data[292].description       | description1                                                                 |
                  | data[292].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[292].is_active         | 1                                                                            |
                  | data[292].is_autoapprove    | 1                                                                            |
                  | data[292].price             | 50000                                                                        |
                  | data[292].qrcodeenable      | 1                                                                            |
                  | data[292].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[292].reasonform_id     |                                                                              |
                  | data[292].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[292].is_smart_asset    | 1                                                                            |
                  | data[292].asset_type_id     | 1                                                                            |

                  | data[293].name              | AssetTest1                                                                   |
                  | data[293].description       | description1                                                                 |
                  | data[293].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[293].is_active         | 1                                                                            |
                  | data[293].is_autoapprove    | 1                                                                            |
                  | data[293].price             | 50000                                                                        |
                  | data[293].qrcodeenable      | 1                                                                            |
                  | data[293].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[293].reasonform_id     |                                                                              |
                  | data[293].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[293].is_smart_asset    | 1                                                                            |
                  | data[293].asset_type_id     | 1                                                                            |

                  | data[294].name              | AssetTest1                                                                   |
                  | data[294].description       | description1                                                                 |
                  | data[294].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[294].is_active         | 1                                                                            |
                  | data[294].is_autoapprove    | 1                                                                            |
                  | data[294].price             | 50000                                                                        |
                  | data[294].qrcodeenable      | 1                                                                            |
                  | data[294].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[294].reasonform_id     |                                                                              |
                  | data[294].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[294].is_smart_asset    | 1                                                                            |
                  | data[294].asset_type_id     | 1                                                                            |

                  | data[295].name              | AssetTest1                                                                   |
                  | data[295].description       | description1                                                                 |
                  | data[295].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[295].is_active         | 1                                                                            |
                  | data[295].is_autoapprove    | 1                                                                            |
                  | data[295].price             | 50000                                                                        |
                  | data[295].qrcodeenable      | 1                                                                            |
                  | data[295].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[295].reasonform_id     |                                                                              |
                  | data[295].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[295].is_smart_asset    | 1                                                                            |
                  | data[295].asset_type_id     | 1                                                                            |

                  | data[296].name              | AssetTest1                                                                   |
                  | data[296].description       | description1                                                                 |
                  | data[296].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[296].is_active         | 1                                                                            |
                  | data[296].is_autoapprove    | 1                                                                            |
                  | data[296].price             | 50000                                                                        |
                  | data[296].qrcodeenable      | 1                                                                            |
                  | data[296].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[296].reasonform_id     |                                                                              |
                  | data[296].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[296].is_smart_asset    | 1                                                                            |
                  | data[296].asset_type_id     | 1                                                                            |

                  | data[297].name              | AssetTest1                                                                   |
                  | data[297].description       | description1                                                                 |
                  | data[297].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[297].is_active         | 1                                                                            |
                  | data[297].is_autoapprove    | 1                                                                            |
                  | data[297].price             | 50000                                                                        |
                  | data[297].qrcodeenable      | 1                                                                            |
                  | data[297].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[297].reasonform_id     |                                                                              |
                  | data[297].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[297].is_smart_asset    | 1                                                                            |
                  | data[297].asset_type_id     | 1                                                                            |

                  | data[298].name              | AssetTest1                                                                   |
                  | data[298].description       | description1                                                                 |
                  | data[298].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[298].is_active         | 1                                                                            |
                  | data[298].is_autoapprove    | 1                                                                            |
                  | data[298].price             | 50000                                                                        |
                  | data[298].qrcodeenable      | 1                                                                            |
                  | data[298].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[298].reasonform_id     |                                                                              |
                  | data[298].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[298].is_smart_asset    | 1                                                                            |
                  | data[298].asset_type_id     | 1                                                                            |

                  | data[299].name              | AssetTest1                                                                   |
                  | data[299].description       | description1                                                                 |
                  | data[299].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[299].is_active         | 1                                                                            |
                  | data[299].is_autoapprove    | 1                                                                            |
                  | data[299].price             | 50000                                                                        |
                  | data[299].qrcodeenable      | 1                                                                            |
                  | data[299].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[299].reasonform_id     |                                                                              |
                  | data[299].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[299].is_smart_asset    | 1                                                                            |
                  | data[299].asset_type_id     | 1                                                                            |

                  | data[300].name              | AssetTest1                                                                   |
                  | data[300].description       | description1                                                                 |
                  | data[300].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[300].is_active         | 1                                                                            |
                  | data[300].is_autoapprove    | 1                                                                            |
                  | data[300].price             | 50000                                                                        |
                  | data[300].qrcodeenable      | 1                                                                            |
                  | data[300].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[300].reasonform_id     |                                                                              |
                  | data[300].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[300].is_smart_asset    | 1                                                                            |
                  | data[300].asset_type_id     | 1                                                                            |

                  | data[301].name              | AssetTest1                                                                   |
                  | data[301].description       | description1                                                                 |
                  | data[301].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[301].is_active         | 1                                                                            |
                  | data[301].is_autoapprove    | 1                                                                            |
                  | data[301].price             | 50000                                                                        |
                  | data[301].qrcodeenable      | 1                                                                            |
                  | data[301].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[301].reasonform_id     |                                                                              |
                  | data[301].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[301].is_smart_asset    | 1                                                                            |
                  | data[301].asset_type_id     | 1                                                                            |

                  | data[302].name              | AssetTest1                                                                   |
                  | data[302].description       | description1                                                                 |
                  | data[302].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[302].is_active         | 1                                                                            |
                  | data[302].is_autoapprove    | 1                                                                            |
                  | data[302].price             | 50000                                                                        |
                  | data[302].qrcodeenable      | 1                                                                            |
                  | data[302].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[302].reasonform_id     |                                                                              |
                  | data[302].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[302].is_smart_asset    | 1                                                                            |
                  | data[302].asset_type_id     | 1                                                                            |

                  | data[303].name              | AssetTest1                                                                   |
                  | data[303].description       | description1                                                                 |
                  | data[303].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[303].is_active         | 1                                                                            |
                  | data[303].is_autoapprove    | 1                                                                            |
                  | data[303].price             | 50000                                                                        |
                  | data[303].qrcodeenable      | 1                                                                            |
                  | data[303].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[303].reasonform_id     |                                                                              |
                  | data[303].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[303].is_smart_asset    | 1                                                                            |
                  | data[303].asset_type_id     | 1                                                                            |

                  | data[304].name              | AssetTest1                                                                   |
                  | data[304].description       | description1                                                                 |
                  | data[304].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[304].is_active         | 1                                                                            |
                  | data[304].is_autoapprove    | 1                                                                            |
                  | data[304].price             | 50000                                                                        |
                  | data[304].qrcodeenable      | 1                                                                            |
                  | data[304].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[304].reasonform_id     |                                                                              |
                  | data[304].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[304].is_smart_asset    | 1                                                                            |
                  | data[304].asset_type_id     | 1                                                                            |

                  | data[305].name              | AssetTest1                                                                   |
                  | data[305].description       | description1                                                                 |
                  | data[305].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[305].is_active         | 1                                                                            |
                  | data[305].is_autoapprove    | 1                                                                            |
                  | data[305].price             | 50000                                                                        |
                  | data[305].qrcodeenable      | 1                                                                            |
                  | data[305].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[305].reasonform_id     |                                                                              |
                  | data[305].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[305].is_smart_asset    | 1                                                                            |
                  | data[305].asset_type_id     | 1                                                                            |

                  | data[306].name              | AssetTest1                                                                   |
                  | data[306].description       | description1                                                                 |
                  | data[306].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[306].is_active         | 1                                                                            |
                  | data[306].is_autoapprove    | 1                                                                            |
                  | data[306].price             | 50000                                                                        |
                  | data[306].qrcodeenable      | 1                                                                            |
                  | data[306].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[306].reasonform_id     |                                                                              |
                  | data[306].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[306].is_smart_asset    | 1                                                                            |
                  | data[306].asset_type_id     | 1                                                                            |

                  | data[307].name              | AssetTest1                                                                   |
                  | data[307].description       | description1                                                                 |
                  | data[307].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[307].is_active         | 1                                                                            |
                  | data[307].is_autoapprove    | 1                                                                            |
                  | data[307].price             | 50000                                                                        |
                  | data[307].qrcodeenable      | 1                                                                            |
                  | data[307].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[307].reasonform_id     |                                                                              |
                  | data[307].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[307].is_smart_asset    | 1                                                                            |
                  | data[307].asset_type_id     | 1                                                                            |

                  | data[308].name              | AssetTest1                                                                   |
                  | data[308].description       | description1                                                                 |
                  | data[308].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[308].is_active         | 1                                                                            |
                  | data[308].is_autoapprove    | 1                                                                            |
                  | data[308].price             | 50000                                                                        |
                  | data[308].qrcodeenable      | 1                                                                            |
                  | data[308].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[308].reasonform_id     |                                                                              |
                  | data[308].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[308].is_smart_asset    | 1                                                                            |
                  | data[308].asset_type_id     | 1                                                                            |

                  | data[309].name              | AssetTest1                                                                   |
                  | data[309].description       | description1                                                                 |
                  | data[309].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[309].is_active         | 1                                                                            |
                  | data[309].is_autoapprove    | 1                                                                            |
                  | data[309].price             | 50000                                                                        |
                  | data[309].qrcodeenable      | 1                                                                            |
                  | data[309].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[309].reasonform_id     |                                                                              |
                  | data[309].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[309].is_smart_asset    | 1                                                                            |
                  | data[309].asset_type_id     | 1                                                                            |

                  | data[310].name              | AssetTest1                                                                   |
                  | data[310].description       | description1                                                                 |
                  | data[310].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[310].is_active         | 1                                                                            |
                  | data[310].is_autoapprove    | 1                                                                            |
                  | data[310].price             | 50000                                                                        |
                  | data[310].qrcodeenable      | 1                                                                            |
                  | data[310].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[310].reasonform_id     |                                                                              |
                  | data[310].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[310].is_smart_asset    | 1                                                                            |
                  | data[310].asset_type_id     | 1                                                                            |

                  | data[311].name              | AssetTest1                                                                   |
                  | data[311].description       | description1                                                                 |
                  | data[311].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[311].is_active         | 1                                                                            |
                  | data[311].is_autoapprove    | 1                                                                            |
                  | data[311].price             | 50000                                                                        |
                  | data[311].qrcodeenable      | 1                                                                            |
                  | data[311].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[311].reasonform_id     |                                                                              |
                  | data[311].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[311].is_smart_asset    | 1                                                                            |
                  | data[311].asset_type_id     | 1                                                                            |

                  | data[312].name              | AssetTest1                                                                   |
                  | data[312].description       | description1                                                                 |
                  | data[312].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[312].is_active         | 1                                                                            |
                  | data[312].is_autoapprove    | 1                                                                            |
                  | data[312].price             | 50000                                                                        |
                  | data[312].qrcodeenable      | 1                                                                            |
                  | data[312].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[312].reasonform_id     |                                                                              |
                  | data[312].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[312].is_smart_asset    | 1                                                                            |
                  | data[312].asset_type_id     | 1                                                                            |

                  | data[313].name              | AssetTest1                                                                   |
                  | data[313].description       | description1                                                                 |
                  | data[313].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[313].is_active         | 1                                                                            |
                  | data[313].is_autoapprove    | 1                                                                            |
                  | data[313].price             | 50000                                                                        |
                  | data[313].qrcodeenable      | 1                                                                            |
                  | data[313].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[313].reasonform_id     |                                                                              |
                  | data[313].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[313].is_smart_asset    | 1                                                                            |
                  | data[313].asset_type_id     | 1                                                                            |

                  | data[314].name              | AssetTest1                                                                   |
                  | data[314].description       | description1                                                                 |
                  | data[314].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[314].is_active         | 1                                                                            |
                  | data[314].is_autoapprove    | 1                                                                            |
                  | data[314].price             | 50000                                                                        |
                  | data[314].qrcodeenable      | 1                                                                            |
                  | data[314].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[314].reasonform_id     |                                                                              |
                  | data[314].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[314].is_smart_asset    | 1                                                                            |
                  | data[314].asset_type_id     | 1                                                                            |

                  | data[315].name              | AssetTest1                                                                   |
                  | data[315].description       | description1                                                                 |
                  | data[315].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[315].is_active         | 1                                                                            |
                  | data[315].is_autoapprove    | 1                                                                            |
                  | data[315].price             | 50000                                                                        |
                  | data[315].qrcodeenable      | 1                                                                            |
                  | data[315].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[315].reasonform_id     |                                                                              |
                  | data[315].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[315].is_smart_asset    | 1                                                                            |
                  | data[315].asset_type_id     | 1                                                                            |

                  | data[316].name              | AssetTest1                                                                   |
                  | data[316].description       | description1                                                                 |
                  | data[316].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[316].is_active         | 1                                                                            |
                  | data[316].is_autoapprove    | 1                                                                            |
                  | data[316].price             | 50000                                                                        |
                  | data[316].qrcodeenable      | 1                                                                            |
                  | data[316].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[316].reasonform_id     |                                                                              |
                  | data[316].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[316].is_smart_asset    | 1                                                                            |
                  | data[316].asset_type_id     | 1                                                                            |

                  | data[317].name              | AssetTest1                                                                   |
                  | data[317].description       | description1                                                                 |
                  | data[317].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[317].is_active         | 1                                                                            |
                  | data[317].is_autoapprove    | 1                                                                            |
                  | data[317].price             | 50000                                                                        |
                  | data[317].qrcodeenable      | 1                                                                            |
                  | data[317].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[317].reasonform_id     |                                                                              |
                  | data[317].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[317].is_smart_asset    | 1                                                                            |
                  | data[317].asset_type_id     | 1                                                                            |

                  | data[318].name              | AssetTest1                                                                   |
                  | data[318].description       | description1                                                                 |
                  | data[318].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[318].is_active         | 1                                                                            |
                  | data[318].is_autoapprove    | 1                                                                            |
                  | data[318].price             | 50000                                                                        |
                  | data[318].qrcodeenable      | 1                                                                            |
                  | data[318].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[318].reasonform_id     |                                                                              |
                  | data[318].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[318].is_smart_asset    | 1                                                                            |
                  | data[318].asset_type_id     | 1                                                                            |

                  | data[319].name              | AssetTest1                                                                   |
                  | data[319].description       | description1                                                                 |
                  | data[319].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[319].is_active         | 1                                                                            |
                  | data[319].is_autoapprove    | 1                                                                            |
                  | data[319].price             | 50000                                                                        |
                  | data[319].qrcodeenable      | 1                                                                            |
                  | data[319].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[319].reasonform_id     |                                                                              |
                  | data[319].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[319].is_smart_asset    | 1                                                                            |
                  | data[319].asset_type_id     | 1                                                                            |

                  | data[320].name              | AssetTest1                                                                   |
                  | data[320].description       | description1                                                                 |
                  | data[320].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[320].is_active         | 1                                                                            |
                  | data[320].is_autoapprove    | 1                                                                            |
                  | data[320].price             | 50000                                                                        |
                  | data[320].qrcodeenable      | 1                                                                            |
                  | data[320].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[320].reasonform_id     |                                                                              |
                  | data[320].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[320].is_smart_asset    | 1                                                                            |
                  | data[320].asset_type_id     | 1                                                                            |

                  | data[321].name              | AssetTest1                                                                   |
                  | data[321].description       | description1                                                                 |
                  | data[321].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[321].is_active         | 1                                                                            |
                  | data[321].is_autoapprove    | 1                                                                            |
                  | data[321].price             | 50000                                                                        |
                  | data[321].qrcodeenable      | 1                                                                            |
                  | data[321].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[321].reasonform_id     |                                                                              |
                  | data[321].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[321].is_smart_asset    | 1                                                                            |
                  | data[321].asset_type_id     | 1                                                                            |

                  | data[322].name              | AssetTest1                                                                   |
                  | data[322].description       | description1                                                                 |
                  | data[322].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[322].is_active         | 1                                                                            |
                  | data[322].is_autoapprove    | 1                                                                            |
                  | data[322].price             | 50000                                                                        |
                  | data[322].qrcodeenable      | 1                                                                            |
                  | data[322].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[322].reasonform_id     |                                                                              |
                  | data[322].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[322].is_smart_asset    | 1                                                                            |
                  | data[322].asset_type_id     | 1                                                                            |

                  | data[323].name              | AssetTest1                                                                   |
                  | data[323].description       | description1                                                                 |
                  | data[323].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[323].is_active         | 1                                                                            |
                  | data[323].is_autoapprove    | 1                                                                            |
                  | data[323].price             | 50000                                                                        |
                  | data[323].qrcodeenable      | 1                                                                            |
                  | data[323].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[323].reasonform_id     |                                                                              |
                  | data[323].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[323].is_smart_asset    | 1                                                                            |
                  | data[323].asset_type_id     | 1                                                                            |

                  | data[324].name              | AssetTest1                                                                   |
                  | data[324].description       | description1                                                                 |
                  | data[324].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[324].is_active         | 1                                                                            |
                  | data[324].is_autoapprove    | 1                                                                            |
                  | data[324].price             | 50000                                                                        |
                  | data[324].qrcodeenable      | 1                                                                            |
                  | data[324].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[324].reasonform_id     |                                                                              |
                  | data[324].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[324].is_smart_asset    | 1                                                                            |
                  | data[324].asset_type_id     | 1                                                                            |

                  | data[325].name              | AssetTest1                                                                   |
                  | data[325].description       | description1                                                                 |
                  | data[325].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[325].is_active         | 1                                                                            |
                  | data[325].is_autoapprove    | 1                                                                            |
                  | data[325].price             | 50000                                                                        |
                  | data[325].qrcodeenable      | 1                                                                            |
                  | data[325].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[325].reasonform_id     |                                                                              |
                  | data[325].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[325].is_smart_asset    | 1                                                                            |
                  | data[325].asset_type_id     | 1                                                                            |

                  | data[326].name              | AssetTest1                                                                   |
                  | data[326].description       | description1                                                                 |
                  | data[326].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[326].is_active         | 1                                                                            |
                  | data[326].is_autoapprove    | 1                                                                            |
                  | data[326].price             | 50000                                                                        |
                  | data[326].qrcodeenable      | 1                                                                            |
                  | data[326].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[326].reasonform_id     |                                                                              |
                  | data[326].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[326].is_smart_asset    | 1                                                                            |
                  | data[326].asset_type_id     | 1                                                                            |

                  | data[327].name              | AssetTest1                                                                   |
                  | data[327].description       | description1                                                                 |
                  | data[327].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[327].is_active         | 1                                                                            |
                  | data[327].is_autoapprove    | 1                                                                            |
                  | data[327].price             | 50000                                                                        |
                  | data[327].qrcodeenable      | 1                                                                            |
                  | data[327].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[327].reasonform_id     |                                                                              |
                  | data[327].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[327].is_smart_asset    | 1                                                                            |
                  | data[327].asset_type_id     | 1                                                                            |

                  | data[328].name              | AssetTest1                                                                   |
                  | data[328].description       | description1                                                                 |
                  | data[328].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[328].is_active         | 1                                                                            |
                  | data[328].is_autoapprove    | 1                                                                            |
                  | data[328].price             | 50000                                                                        |
                  | data[328].qrcodeenable      | 1                                                                            |
                  | data[328].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[328].reasonform_id     |                                                                              |
                  | data[328].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[328].is_smart_asset    | 1                                                                            |
                  | data[328].asset_type_id     | 1                                                                            |

                  | data[329].name              | AssetTest1                                                                   |
                  | data[329].description       | description1                                                                 |
                  | data[329].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[329].is_active         | 1                                                                            |
                  | data[329].is_autoapprove    | 1                                                                            |
                  | data[329].price             | 50000                                                                        |
                  | data[329].qrcodeenable      | 1                                                                            |
                  | data[329].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[329].reasonform_id     |                                                                              |
                  | data[329].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[329].is_smart_asset    | 1                                                                            |
                  | data[329].asset_type_id     | 1                                                                            |

                  | data[330].name              | AssetTest1                                                                   |
                  | data[330].description       | description1                                                                 |
                  | data[330].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[330].is_active         | 1                                                                            |
                  | data[330].is_autoapprove    | 1                                                                            |
                  | data[330].price             | 50000                                                                        |
                  | data[330].qrcodeenable      | 1                                                                            |
                  | data[330].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[330].reasonform_id     |                                                                              |
                  | data[330].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[330].is_smart_asset    | 1                                                                            |
                  | data[330].asset_type_id     | 1                                                                            |

                  | data[331].name              | AssetTest1                                                                   |
                  | data[331].description       | description1                                                                 |
                  | data[331].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[331].is_active         | 1                                                                            |
                  | data[331].is_autoapprove    | 1                                                                            |
                  | data[331].price             | 50000                                                                        |
                  | data[331].qrcodeenable      | 1                                                                            |
                  | data[331].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[331].reasonform_id     |                                                                              |
                  | data[331].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[331].is_smart_asset    | 1                                                                            |
                  | data[331].asset_type_id     | 1                                                                            |

                  | data[332].name              | AssetTest1                                                                   |
                  | data[332].description       | description1                                                                 |
                  | data[332].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[332].is_active         | 1                                                                            |
                  | data[332].is_autoapprove    | 1                                                                            |
                  | data[332].price             | 50000                                                                        |
                  | data[332].qrcodeenable      | 1                                                                            |
                  | data[332].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[332].reasonform_id     |                                                                              |
                  | data[332].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[332].is_smart_asset    | 1                                                                            |
                  | data[332].asset_type_id     | 1                                                                            |

                  | data[333].name              | AssetTest1                                                                   |
                  | data[333].description       | description1                                                                 |
                  | data[333].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[333].is_active         | 1                                                                            |
                  | data[333].is_autoapprove    | 1                                                                            |
                  | data[333].price             | 50000                                                                        |
                  | data[333].qrcodeenable      | 1                                                                            |
                  | data[333].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[333].reasonform_id     |                                                                              |
                  | data[333].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[333].is_smart_asset    | 1                                                                            |
                  | data[333].asset_type_id     | 1                                                                            |

                  | data[334].name              | AssetTest1                                                                   |
                  | data[334].description       | description1                                                                 |
                  | data[334].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[334].is_active         | 1                                                                            |
                  | data[334].is_autoapprove    | 1                                                                            |
                  | data[334].price             | 50000                                                                        |
                  | data[334].qrcodeenable      | 1                                                                            |
                  | data[334].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[334].reasonform_id     |                                                                              |
                  | data[334].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[334].is_smart_asset    | 1                                                                            |
                  | data[334].asset_type_id     | 1                                                                            |

                  | data[335].name              | AssetTest1                                                                   |
                  | data[335].description       | description1                                                                 |
                  | data[335].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[335].is_active         | 1                                                                            |
                  | data[335].is_autoapprove    | 1                                                                            |
                  | data[335].price             | 50000                                                                        |
                  | data[335].qrcodeenable      | 1                                                                            |
                  | data[335].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[335].reasonform_id     |                                                                              |
                  | data[335].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[335].is_smart_asset    | 1                                                                            |
                  | data[335].asset_type_id     | 1                                                                            |

                  | data[336].name              | AssetTest1                                                                   |
                  | data[336].description       | description1                                                                 |
                  | data[336].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[336].is_active         | 1                                                                            |
                  | data[336].is_autoapprove    | 1                                                                            |
                  | data[336].price             | 50000                                                                        |
                  | data[336].qrcodeenable      | 1                                                                            |
                  | data[336].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[336].reasonform_id     |                                                                              |
                  | data[336].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[336].is_smart_asset    | 1                                                                            |
                  | data[336].asset_type_id     | 1                                                                            |

                  | data[337].name              | AssetTest1                                                                   |
                  | data[337].description       | description1                                                                 |
                  | data[337].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[337].is_active         | 1                                                                            |
                  | data[337].is_autoapprove    | 1                                                                            |
                  | data[337].price             | 50000                                                                        |
                  | data[337].qrcodeenable      | 1                                                                            |
                  | data[337].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[337].reasonform_id     |                                                                              |
                  | data[337].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[337].is_smart_asset    | 1                                                                            |
                  | data[337].asset_type_id     | 1                                                                            |

                  | data[338].name              | AssetTest1                                                                   |
                  | data[338].description       | description1                                                                 |
                  | data[338].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[338].is_active         | 1                                                                            |
                  | data[338].is_autoapprove    | 1                                                                            |
                  | data[338].price             | 50000                                                                        |
                  | data[338].qrcodeenable      | 1                                                                            |
                  | data[338].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[338].reasonform_id     |                                                                              |
                  | data[338].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[338].is_smart_asset    | 1                                                                            |
                  | data[338].asset_type_id     | 1                                                                            |

                  | data[339].name              | AssetTest1                                                                   |
                  | data[339].description       | description1                                                                 |
                  | data[339].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[339].is_active         | 1                                                                            |
                  | data[339].is_autoapprove    | 1                                                                            |
                  | data[339].price             | 50000                                                                        |
                  | data[339].qrcodeenable      | 1                                                                            |
                  | data[339].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[339].reasonform_id     |                                                                              |
                  | data[339].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[339].is_smart_asset    | 1                                                                            |
                  | data[339].asset_type_id     | 1                                                                            |

                  | data[340].name              | AssetTest1                                                                   |
                  | data[340].description       | description1                                                                 |
                  | data[340].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[340].is_active         | 1                                                                            |
                  | data[340].is_autoapprove    | 1                                                                            |
                  | data[340].price             | 50000                                                                        |
                  | data[340].qrcodeenable      | 1                                                                            |
                  | data[340].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[340].reasonform_id     |                                                                              |
                  | data[340].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[340].is_smart_asset    | 1                                                                            |
                  | data[340].asset_type_id     | 1                                                                            |

                  | data[341].name              | AssetTest1                                                                   |
                  | data[341].description       | description1                                                                 |
                  | data[341].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[341].is_active         | 1                                                                            |
                  | data[341].is_autoapprove    | 1                                                                            |
                  | data[341].price             | 50000                                                                        |
                  | data[341].qrcodeenable      | 1                                                                            |
                  | data[341].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[341].reasonform_id     |                                                                              |
                  | data[341].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[341].is_smart_asset    | 1                                                                            |
                  | data[341].asset_type_id     | 1                                                                            |

                  | data[342].name              | AssetTest1                                                                   |
                  | data[342].description       | description1                                                                 |
                  | data[342].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[342].is_active         | 1                                                                            |
                  | data[342].is_autoapprove    | 1                                                                            |
                  | data[342].price             | 50000                                                                        |
                  | data[342].qrcodeenable      | 1                                                                            |
                  | data[342].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[342].reasonform_id     |                                                                              |
                  | data[342].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[342].is_smart_asset    | 1                                                                            |
                  | data[342].asset_type_id     | 1                                                                            |

                  | data[343].name              | AssetTest1                                                                   |
                  | data[343].description       | description1                                                                 |
                  | data[343].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[343].is_active         | 1                                                                            |
                  | data[343].is_autoapprove    | 1                                                                            |
                  | data[343].price             | 50000                                                                        |
                  | data[343].qrcodeenable      | 1                                                                            |
                  | data[343].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[343].reasonform_id     |                                                                              |
                  | data[343].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[343].is_smart_asset    | 1                                                                            |
                  | data[343].asset_type_id     | 1                                                                            |

                  | data[344].name              | AssetTest1                                                                   |
                  | data[344].description       | description1                                                                 |
                  | data[344].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[344].is_active         | 1                                                                            |
                  | data[344].is_autoapprove    | 1                                                                            |
                  | data[344].price             | 50000                                                                        |
                  | data[344].qrcodeenable      | 1                                                                            |
                  | data[344].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[344].reasonform_id     |                                                                              |
                  | data[344].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[344].is_smart_asset    | 1                                                                            |
                  | data[344].asset_type_id     | 1                                                                            |

                  | data[345].name              | AssetTest1                                                                   |
                  | data[345].description       | description1                                                                 |
                  | data[345].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[345].is_active         | 1                                                                            |
                  | data[345].is_autoapprove    | 1                                                                            |
                  | data[345].price             | 50000                                                                        |
                  | data[345].qrcodeenable      | 1                                                                            |
                  | data[345].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[345].reasonform_id     |                                                                              |
                  | data[345].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[345].is_smart_asset    | 1                                                                            |
                  | data[345].asset_type_id     | 1                                                                            |

                  | data[346].name              | AssetTest1                                                                   |
                  | data[346].description       | description1                                                                 |
                  | data[346].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[346].is_active         | 1                                                                            |
                  | data[346].is_autoapprove    | 1                                                                            |
                  | data[346].price             | 50000                                                                        |
                  | data[346].qrcodeenable      | 1                                                                            |
                  | data[346].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[346].reasonform_id     |                                                                              |
                  | data[346].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[346].is_smart_asset    | 1                                                                            |
                  | data[346].asset_type_id     | 1                                                                            |

                  | data[347].name              | AssetTest1                                                                   |
                  | data[347].description       | description1                                                                 |
                  | data[347].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[347].is_active         | 1                                                                            |
                  | data[347].is_autoapprove    | 1                                                                            |
                  | data[347].price             | 50000                                                                        |
                  | data[347].qrcodeenable      | 1                                                                            |
                  | data[347].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[347].reasonform_id     |                                                                              |
                  | data[347].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[347].is_smart_asset    | 1                                                                            |
                  | data[347].asset_type_id     | 1                                                                            |

                  | data[348].name              | AssetTest1                                                                   |
                  | data[348].description       | description1                                                                 |
                  | data[348].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[348].is_active         | 1                                                                            |
                  | data[348].is_autoapprove    | 1                                                                            |
                  | data[348].price             | 50000                                                                        |
                  | data[348].qrcodeenable      | 1                                                                            |
                  | data[348].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[348].reasonform_id     |                                                                              |
                  | data[348].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[348].is_smart_asset    | 1                                                                            |
                  | data[348].asset_type_id     | 1                                                                            |

                  | data[349].name              | AssetTest1                                                                   |
                  | data[349].description       | description1                                                                 |
                  | data[349].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[349].is_active         | 1                                                                            |
                  | data[349].is_autoapprove    | 1                                                                            |
                  | data[349].price             | 50000                                                                        |
                  | data[349].qrcodeenable      | 1                                                                            |
                  | data[349].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[349].reasonform_id     |                                                                              |
                  | data[349].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[349].is_smart_asset    | 1                                                                            |
                  | data[349].asset_type_id     | 1                                                                            |

                  | data[350].name              | AssetTest1                                                                   |
                  | data[350].description       | description1                                                                 |
                  | data[350].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[350].is_active         | 1                                                                            |
                  | data[350].is_autoapprove    | 1                                                                            |
                  | data[350].price             | 50000                                                                        |
                  | data[350].qrcodeenable      | 1                                                                            |
                  | data[350].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[350].reasonform_id     |                                                                              |
                  | data[350].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[350].is_smart_asset    | 1                                                                            |
                  | data[350].asset_type_id     | 1                                                                            |

                  | data[351].name              | AssetTest1                                                                   |
                  | data[351].description       | description1                                                                 |
                  | data[351].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[351].is_active         | 1                                                                            |
                  | data[351].is_autoapprove    | 1                                                                            |
                  | data[351].price             | 50000                                                                        |
                  | data[351].qrcodeenable      | 1                                                                            |
                  | data[351].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[351].reasonform_id     |                                                                              |
                  | data[351].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[351].is_smart_asset    | 1                                                                            |
                  | data[351].asset_type_id     | 1                                                                            |

                  | data[352].name              | AssetTest1                                                                   |
                  | data[352].description       | description1                                                                 |
                  | data[352].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[352].is_active         | 1                                                                            |
                  | data[352].is_autoapprove    | 1                                                                            |
                  | data[352].price             | 50000                                                                        |
                  | data[352].qrcodeenable      | 1                                                                            |
                  | data[352].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[352].reasonform_id     |                                                                              |
                  | data[352].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[352].is_smart_asset    | 1                                                                            |
                  | data[352].asset_type_id     | 1                                                                            |

                  | data[353].name              | AssetTest1                                                                   |
                  | data[353].description       | description1                                                                 |
                  | data[353].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[353].is_active         | 1                                                                            |
                  | data[353].is_autoapprove    | 1                                                                            |
                  | data[353].price             | 50000                                                                        |
                  | data[353].qrcodeenable      | 1                                                                            |
                  | data[353].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[353].reasonform_id     |                                                                              |
                  | data[353].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[353].is_smart_asset    | 1                                                                            |
                  | data[353].asset_type_id     | 1                                                                            |

                  | data[354].name              | AssetTest1                                                                   |
                  | data[354].description       | description1                                                                 |
                  | data[354].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[354].is_active         | 1                                                                            |
                  | data[354].is_autoapprove    | 1                                                                            |
                  | data[354].price             | 50000                                                                        |
                  | data[354].qrcodeenable      | 1                                                                            |
                  | data[354].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[354].reasonform_id     |                                                                              |
                  | data[354].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[354].is_smart_asset    | 1                                                                            |
                  | data[354].asset_type_id     | 1                                                                            |

                  | data[355].name              | AssetTest1                                                                   |
                  | data[355].description       | description1                                                                 |
                  | data[355].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[355].is_active         | 1                                                                            |
                  | data[355].is_autoapprove    | 1                                                                            |
                  | data[355].price             | 50000                                                                        |
                  | data[355].qrcodeenable      | 1                                                                            |
                  | data[355].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[355].reasonform_id     |                                                                              |
                  | data[355].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[355].is_smart_asset    | 1                                                                            |
                  | data[355].asset_type_id     | 1                                                                            |

                  | data[356].name              | AssetTest1                                                                   |
                  | data[356].description       | description1                                                                 |
                  | data[356].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[356].is_active         | 1                                                                            |
                  | data[356].is_autoapprove    | 1                                                                            |
                  | data[356].price             | 50000                                                                        |
                  | data[356].qrcodeenable      | 1                                                                            |
                  | data[356].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[356].reasonform_id     |                                                                              |
                  | data[356].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[356].is_smart_asset    | 1                                                                            |
                  | data[356].asset_type_id     | 1                                                                            |

                  | data[357].name              | AssetTest1                                                                   |
                  | data[357].description       | description1                                                                 |
                  | data[357].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[357].is_active         | 1                                                                            |
                  | data[357].is_autoapprove    | 1                                                                            |
                  | data[357].price             | 50000                                                                        |
                  | data[357].qrcodeenable      | 1                                                                            |
                  | data[357].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[357].reasonform_id     |                                                                              |
                  | data[357].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[357].is_smart_asset    | 1                                                                            |
                  | data[357].asset_type_id     | 1                                                                            |

                  | data[358].name              | AssetTest1                                                                   |
                  | data[358].description       | description1                                                                 |
                  | data[358].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[358].is_active         | 1                                                                            |
                  | data[358].is_autoapprove    | 1                                                                            |
                  | data[358].price             | 50000                                                                        |
                  | data[358].qrcodeenable      | 1                                                                            |
                  | data[358].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[358].reasonform_id     |                                                                              |
                  | data[358].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[358].is_smart_asset    | 1                                                                            |
                  | data[358].asset_type_id     | 1                                                                            |

                  | data[359].name              | AssetTest1                                                                   |
                  | data[359].description       | description1                                                                 |
                  | data[359].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[359].is_active         | 1                                                                            |
                  | data[359].is_autoapprove    | 1                                                                            |
                  | data[359].price             | 50000                                                                        |
                  | data[359].qrcodeenable      | 1                                                                            |
                  | data[359].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[359].reasonform_id     |                                                                              |
                  | data[359].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[359].is_smart_asset    | 1                                                                            |
                  | data[359].asset_type_id     | 1                                                                            |

                  | data[360].name              | AssetTest1                                                                   |
                  | data[360].description       | description1                                                                 |
                  | data[360].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[360].is_active         | 1                                                                            |
                  | data[360].is_autoapprove    | 1                                                                            |
                  | data[360].price             | 50000                                                                        |
                  | data[360].qrcodeenable      | 1                                                                            |
                  | data[360].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[360].reasonform_id     |                                                                              |
                  | data[360].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[360].is_smart_asset    | 1                                                                            |
                  | data[360].asset_type_id     | 1                                                                            |

                  | data[361].name              | AssetTest1                                                                   |
                  | data[361].description       | description1                                                                 |
                  | data[361].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[361].is_active         | 1                                                                            |
                  | data[361].is_autoapprove    | 1                                                                            |
                  | data[361].price             | 50000                                                                        |
                  | data[361].qrcodeenable      | 1                                                                            |
                  | data[361].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[361].reasonform_id     |                                                                              |
                  | data[361].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[361].is_smart_asset    | 1                                                                            |
                  | data[361].asset_type_id     | 1                                                                            |

                  | data[362].name              | AssetTest1                                                                   |
                  | data[362].description       | description1                                                                 |
                  | data[362].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[362].is_active         | 1                                                                            |
                  | data[362].is_autoapprove    | 1                                                                            |
                  | data[362].price             | 50000                                                                        |
                  | data[362].qrcodeenable      | 1                                                                            |
                  | data[362].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[362].reasonform_id     |                                                                              |
                  | data[362].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[362].is_smart_asset    | 1                                                                            |
                  | data[362].asset_type_id     | 1                                                                            |

                  | data[363].name              | AssetTest1                                                                   |
                  | data[363].description       | description1                                                                 |
                  | data[363].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[363].is_active         | 1                                                                            |
                  | data[363].is_autoapprove    | 1                                                                            |
                  | data[363].price             | 50000                                                                        |
                  | data[363].qrcodeenable      | 1                                                                            |
                  | data[363].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[363].reasonform_id     |                                                                              |
                  | data[363].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[363].is_smart_asset    | 1                                                                            |
                  | data[363].asset_type_id     | 1                                                                            |

                  | data[364].name              | AssetTest1                                                                   |
                  | data[364].description       | description1                                                                 |
                  | data[364].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[364].is_active         | 1                                                                            |
                  | data[364].is_autoapprove    | 1                                                                            |
                  | data[364].price             | 50000                                                                        |
                  | data[364].qrcodeenable      | 1                                                                            |
                  | data[364].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[364].reasonform_id     |                                                                              |
                  | data[364].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[364].is_smart_asset    | 1                                                                            |
                  | data[364].asset_type_id     | 1                                                                            |

                  | data[365].name              | AssetTest1                                                                   |
                  | data[365].description       | description1                                                                 |
                  | data[365].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[365].is_active         | 1                                                                            |
                  | data[365].is_autoapprove    | 1                                                                            |
                  | data[365].price             | 50000                                                                        |
                  | data[365].qrcodeenable      | 1                                                                            |
                  | data[365].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[365].reasonform_id     |                                                                              |
                  | data[365].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[365].is_smart_asset    | 1                                                                            |
                  | data[365].asset_type_id     | 1                                                                            |

                  | data[366].name              | AssetTest1                                                                   |
                  | data[366].description       | description1                                                                 |
                  | data[366].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[366].is_active         | 1                                                                            |
                  | data[366].is_autoapprove    | 1                                                                            |
                  | data[366].price             | 50000                                                                        |
                  | data[366].qrcodeenable      | 1                                                                            |
                  | data[366].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[366].reasonform_id     |                                                                              |
                  | data[366].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[366].is_smart_asset    | 1                                                                            |
                  | data[366].asset_type_id     | 1                                                                            |

                  | data[367].name              | AssetTest1                                                                   |
                  | data[367].description       | description1                                                                 |
                  | data[367].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[367].is_active         | 1                                                                            |
                  | data[367].is_autoapprove    | 1                                                                            |
                  | data[367].price             | 50000                                                                        |
                  | data[367].qrcodeenable      | 1                                                                            |
                  | data[367].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[367].reasonform_id     |                                                                              |
                  | data[367].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[367].is_smart_asset    | 1                                                                            |
                  | data[367].asset_type_id     | 1                                                                            |

                  | data[368].name              | AssetTest1                                                                   |
                  | data[368].description       | description1                                                                 |
                  | data[368].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[368].is_active         | 1                                                                            |
                  | data[368].is_autoapprove    | 1                                                                            |
                  | data[368].price             | 50000                                                                        |
                  | data[368].qrcodeenable      | 1                                                                            |
                  | data[368].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[368].reasonform_id     |                                                                              |
                  | data[368].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[368].is_smart_asset    | 1                                                                            |
                  | data[368].asset_type_id     | 1                                                                            |

                  | data[369].name              | AssetTest1                                                                   |
                  | data[369].description       | description1                                                                 |
                  | data[369].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[369].is_active         | 1                                                                            |
                  | data[369].is_autoapprove    | 1                                                                            |
                  | data[369].price             | 50000                                                                        |
                  | data[369].qrcodeenable      | 1                                                                            |
                  | data[369].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[369].reasonform_id     |                                                                              |
                  | data[369].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[369].is_smart_asset    | 1                                                                            |
                  | data[369].asset_type_id     | 1                                                                            |

                  | data[370].name              | AssetTest1                                                                   |
                  | data[370].description       | description1                                                                 |
                  | data[370].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[370].is_active         | 1                                                                            |
                  | data[370].is_autoapprove    | 1                                                                            |
                  | data[370].price             | 50000                                                                        |
                  | data[370].qrcodeenable      | 1                                                                            |
                  | data[370].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[370].reasonform_id     |                                                                              |
                  | data[370].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[370].is_smart_asset    | 1                                                                            |
                  | data[370].asset_type_id     | 1                                                                            |

                  | data[371].name              | AssetTest1                                                                   |
                  | data[371].description       | description1                                                                 |
                  | data[371].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[371].is_active         | 1                                                                            |
                  | data[371].is_autoapprove    | 1                                                                            |
                  | data[371].price             | 50000                                                                        |
                  | data[371].qrcodeenable      | 1                                                                            |
                  | data[371].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[371].reasonform_id     |                                                                              |
                  | data[371].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[371].is_smart_asset    | 1                                                                            |
                  | data[371].asset_type_id     | 1                                                                            |

                  | data[372].name              | AssetTest1                                                                   |
                  | data[372].description       | description1                                                                 |
                  | data[372].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[372].is_active         | 1                                                                            |
                  | data[372].is_autoapprove    | 1                                                                            |
                  | data[372].price             | 50000                                                                        |
                  | data[372].qrcodeenable      | 1                                                                            |
                  | data[372].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[372].reasonform_id     |                                                                              |
                  | data[372].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[372].is_smart_asset    | 1                                                                            |
                  | data[372].asset_type_id     | 1                                                                            |

                  | data[373].name              | AssetTest1                                                                   |
                  | data[373].description       | description1                                                                 |
                  | data[373].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[373].is_active         | 1                                                                            |
                  | data[373].is_autoapprove    | 1                                                                            |
                  | data[373].price             | 50000                                                                        |
                  | data[373].qrcodeenable      | 1                                                                            |
                  | data[373].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[373].reasonform_id     |                                                                              |
                  | data[373].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[373].is_smart_asset    | 1                                                                            |
                  | data[373].asset_type_id     | 1                                                                            |

                  | data[374].name              | AssetTest1                                                                   |
                  | data[374].description       | description1                                                                 |
                  | data[374].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[374].is_active         | 1                                                                            |
                  | data[374].is_autoapprove    | 1                                                                            |
                  | data[374].price             | 50000                                                                        |
                  | data[374].qrcodeenable      | 1                                                                            |
                  | data[374].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[374].reasonform_id     |                                                                              |
                  | data[374].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[374].is_smart_asset    | 1                                                                            |
                  | data[374].asset_type_id     | 1                                                                            |

                  | data[375].name              | AssetTest1                                                                   |
                  | data[375].description       | description1                                                                 |
                  | data[375].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[375].is_active         | 1                                                                            |
                  | data[375].is_autoapprove    | 1                                                                            |
                  | data[375].price             | 50000                                                                        |
                  | data[375].qrcodeenable      | 1                                                                            |
                  | data[375].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[375].reasonform_id     |                                                                              |
                  | data[375].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[375].is_smart_asset    | 1                                                                            |
                  | data[375].asset_type_id     | 1                                                                            |

                  | data[376].name              | AssetTest1                                                                   |
                  | data[376].description       | description1                                                                 |
                  | data[376].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[376].is_active         | 1                                                                            |
                  | data[376].is_autoapprove    | 1                                                                            |
                  | data[376].price             | 50000                                                                        |
                  | data[376].qrcodeenable      | 1                                                                            |
                  | data[376].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[376].reasonform_id     |                                                                              |
                  | data[376].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[376].is_smart_asset    | 1                                                                            |
                  | data[376].asset_type_id     | 1                                                                            |

                  | data[377].name              | AssetTest1                                                                   |
                  | data[377].description       | description1                                                                 |
                  | data[377].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[377].is_active         | 1                                                                            |
                  | data[377].is_autoapprove    | 1                                                                            |
                  | data[377].price             | 50000                                                                        |
                  | data[377].qrcodeenable      | 1                                                                            |
                  | data[377].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[377].reasonform_id     |                                                                              |
                  | data[377].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[377].is_smart_asset    | 1                                                                            |
                  | data[377].asset_type_id     | 1                                                                            |

                  | data[378].name              | AssetTest1                                                                   |
                  | data[378].description       | description1                                                                 |
                  | data[378].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[378].is_active         | 1                                                                            |
                  | data[378].is_autoapprove    | 1                                                                            |
                  | data[378].price             | 50000                                                                        |
                  | data[378].qrcodeenable      | 1                                                                            |
                  | data[378].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[378].reasonform_id     |                                                                              |
                  | data[378].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[378].is_smart_asset    | 1                                                                            |
                  | data[378].asset_type_id     | 1                                                                            |

                  | data[379].name              | AssetTest1                                                                   |
                  | data[379].description       | description1                                                                 |
                  | data[379].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[379].is_active         | 1                                                                            |
                  | data[379].is_autoapprove    | 1                                                                            |
                  | data[379].price             | 50000                                                                        |
                  | data[379].qrcodeenable      | 1                                                                            |
                  | data[379].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[379].reasonform_id     |                                                                              |
                  | data[379].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[379].is_smart_asset    | 1                                                                            |
                  | data[379].asset_type_id     | 1                                                                            |

                  | data[380].name              | AssetTest1                                                                   |
                  | data[380].description       | description1                                                                 |
                  | data[380].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[380].is_active         | 1                                                                            |
                  | data[380].is_autoapprove    | 1                                                                            |
                  | data[380].price             | 50000                                                                        |
                  | data[380].qrcodeenable      | 1                                                                            |
                  | data[380].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[380].reasonform_id     |                                                                              |
                  | data[380].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[380].is_smart_asset    | 1                                                                            |
                  | data[380].asset_type_id     | 1                                                                            |

                  | data[381].name              | AssetTest1                                                                   |
                  | data[381].description       | description1                                                                 |
                  | data[381].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[381].is_active         | 1                                                                            |
                  | data[381].is_autoapprove    | 1                                                                            |
                  | data[381].price             | 50000                                                                        |
                  | data[381].qrcodeenable      | 1                                                                            |
                  | data[381].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[381].reasonform_id     |                                                                              |
                  | data[381].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[381].is_smart_asset    | 1                                                                            |
                  | data[381].asset_type_id     | 1                                                                            |

                  | data[382].name              | AssetTest1                                                                   |
                  | data[382].description       | description1                                                                 |
                  | data[382].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[382].is_active         | 1                                                                            |
                  | data[382].is_autoapprove    | 1                                                                            |
                  | data[382].price             | 50000                                                                        |
                  | data[382].qrcodeenable      | 1                                                                            |
                  | data[382].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[382].reasonform_id     |                                                                              |
                  | data[382].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[382].is_smart_asset    | 1                                                                            |
                  | data[382].asset_type_id     | 1                                                                            |

                  | data[383].name              | AssetTest1                                                                   |
                  | data[383].description       | description1                                                                 |
                  | data[383].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[383].is_active         | 1                                                                            |
                  | data[383].is_autoapprove    | 1                                                                            |
                  | data[383].price             | 50000                                                                        |
                  | data[383].qrcodeenable      | 1                                                                            |
                  | data[383].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[383].reasonform_id     |                                                                              |
                  | data[383].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[383].is_smart_asset    | 1                                                                            |
                  | data[383].asset_type_id     | 1                                                                            |

                  | data[384].name              | AssetTest1                                                                   |
                  | data[384].description       | description1                                                                 |
                  | data[384].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[384].is_active         | 1                                                                            |
                  | data[384].is_autoapprove    | 1                                                                            |
                  | data[384].price             | 50000                                                                        |
                  | data[384].qrcodeenable      | 1                                                                            |
                  | data[384].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[384].reasonform_id     |                                                                              |
                  | data[384].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[384].is_smart_asset    | 1                                                                            |
                  | data[384].asset_type_id     | 1                                                                            |

                  | data[385].name              | AssetTest1                                                                   |
                  | data[385].description       | description1                                                                 |
                  | data[385].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[385].is_active         | 1                                                                            |
                  | data[385].is_autoapprove    | 1                                                                            |
                  | data[385].price             | 50000                                                                        |
                  | data[385].qrcodeenable      | 1                                                                            |
                  | data[385].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[385].reasonform_id     |                                                                              |
                  | data[385].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[385].is_smart_asset    | 1                                                                            |
                  | data[385].asset_type_id     | 1                                                                            |

                  | data[386].name              | AssetTest1                                                                   |
                  | data[386].description       | description1                                                                 |
                  | data[386].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[386].is_active         | 1                                                                            |
                  | data[386].is_autoapprove    | 1                                                                            |
                  | data[386].price             | 50000                                                                        |
                  | data[386].qrcodeenable      | 1                                                                            |
                  | data[386].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[386].reasonform_id     |                                                                              |
                  | data[386].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[386].is_smart_asset    | 1                                                                            |
                  | data[386].asset_type_id     | 1                                                                            |

                  | data[387].name              | AssetTest1                                                                   |
                  | data[387].description       | description1                                                                 |
                  | data[387].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[387].is_active         | 1                                                                            |
                  | data[387].is_autoapprove    | 1                                                                            |
                  | data[387].price             | 50000                                                                        |
                  | data[387].qrcodeenable      | 1                                                                            |
                  | data[387].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[387].reasonform_id     |                                                                              |
                  | data[387].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[387].is_smart_asset    | 1                                                                            |
                  | data[387].asset_type_id     | 1                                                                            |

                  | data[388].name              | AssetTest1                                                                   |
                  | data[388].description       | description1                                                                 |
                  | data[388].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[388].is_active         | 1                                                                            |
                  | data[388].is_autoapprove    | 1                                                                            |
                  | data[388].price             | 50000                                                                        |
                  | data[388].qrcodeenable      | 1                                                                            |
                  | data[388].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[388].reasonform_id     |                                                                              |
                  | data[388].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[388].is_smart_asset    | 1                                                                            |
                  | data[388].asset_type_id     | 1                                                                            |

                  | data[389].name              | AssetTest1                                                                   |
                  | data[389].description       | description1                                                                 |
                  | data[389].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[389].is_active         | 1                                                                            |
                  | data[389].is_autoapprove    | 1                                                                            |
                  | data[389].price             | 50000                                                                        |
                  | data[389].qrcodeenable      | 1                                                                            |
                  | data[389].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[389].reasonform_id     |                                                                              |
                  | data[389].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[389].is_smart_asset    | 1                                                                            |
                  | data[389].asset_type_id     | 1                                                                            |

                  | data[390].name              | AssetTest1                                                                   |
                  | data[390].description       | description1                                                                 |
                  | data[390].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[390].is_active         | 1                                                                            |
                  | data[390].is_autoapprove    | 1                                                                            |
                  | data[390].price             | 50000                                                                        |
                  | data[390].qrcodeenable      | 1                                                                            |
                  | data[390].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[390].reasonform_id     |                                                                              |
                  | data[390].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[390].is_smart_asset    | 1                                                                            |
                  | data[390].asset_type_id     | 1                                                                            |

                  | data[391].name              | AssetTest1                                                                   |
                  | data[391].description       | description1                                                                 |
                  | data[391].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[391].is_active         | 1                                                                            |
                  | data[391].is_autoapprove    | 1                                                                            |
                  | data[391].price             | 50000                                                                        |
                  | data[391].qrcodeenable      | 1                                                                            |
                  | data[391].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[391].reasonform_id     |                                                                              |
                  | data[391].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[391].is_smart_asset    | 1                                                                            |
                  | data[391].asset_type_id     | 1                                                                            |

                  | data[392].name              | AssetTest1                                                                   |
                  | data[392].description       | description1                                                                 |
                  | data[392].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[392].is_active         | 1                                                                            |
                  | data[392].is_autoapprove    | 1                                                                            |
                  | data[392].price             | 50000                                                                        |
                  | data[392].qrcodeenable      | 1                                                                            |
                  | data[392].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[392].reasonform_id     |                                                                              |
                  | data[392].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[392].is_smart_asset    | 1                                                                            |
                  | data[392].asset_type_id     | 1                                                                            |

                  | data[393].name              | AssetTest1                                                                   |
                  | data[393].description       | description1                                                                 |
                  | data[393].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[393].is_active         | 1                                                                            |
                  | data[393].is_autoapprove    | 1                                                                            |
                  | data[393].price             | 50000                                                                        |
                  | data[393].qrcodeenable      | 1                                                                            |
                  | data[393].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[393].reasonform_id     |                                                                              |
                  | data[393].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[393].is_smart_asset    | 1                                                                            |
                  | data[393].asset_type_id     | 1                                                                            |

                  | data[394].name              | AssetTest1                                                                   |
                  | data[394].description       | description1                                                                 |
                  | data[394].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[394].is_active         | 1                                                                            |
                  | data[394].is_autoapprove    | 1                                                                            |
                  | data[394].price             | 50000                                                                        |
                  | data[394].qrcodeenable      | 1                                                                            |
                  | data[394].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[394].reasonform_id     |                                                                              |
                  | data[394].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[394].is_smart_asset    | 1                                                                            |
                  | data[394].asset_type_id     | 1                                                                            |

                  | data[395].name              | AssetTest1                                                                   |
                  | data[395].description       | description1                                                                 |
                  | data[395].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[395].is_active         | 1                                                                            |
                  | data[395].is_autoapprove    | 1                                                                            |
                  | data[395].price             | 50000                                                                        |
                  | data[395].qrcodeenable      | 1                                                                            |
                  | data[395].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[395].reasonform_id     |                                                                              |
                  | data[395].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[395].is_smart_asset    | 1                                                                            |
                  | data[395].asset_type_id     | 1                                                                            |

                  | data[396].name              | AssetTest1                                                                   |
                  | data[396].description       | description1                                                                 |
                  | data[396].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[396].is_active         | 1                                                                            |
                  | data[396].is_autoapprove    | 1                                                                            |
                  | data[396].price             | 50000                                                                        |
                  | data[396].qrcodeenable      | 1                                                                            |
                  | data[396].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[396].reasonform_id     |                                                                              |
                  | data[396].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[396].is_smart_asset    | 1                                                                            |
                  | data[396].asset_type_id     | 1                                                                            |

                  | data[397].name              | AssetTest1                                                                   |
                  | data[397].description       | description1                                                                 |
                  | data[397].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[397].is_active         | 1                                                                            |
                  | data[397].is_autoapprove    | 1                                                                            |
                  | data[397].price             | 50000                                                                        |
                  | data[397].qrcodeenable      | 1                                                                            |
                  | data[397].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[397].reasonform_id     |                                                                              |
                  | data[397].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[397].is_smart_asset    | 1                                                                            |
                  | data[397].asset_type_id     | 1                                                                            |

                  | data[398].name              | AssetTest1                                                                   |
                  | data[398].description       | description1                                                                 |
                  | data[398].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[398].is_active         | 1                                                                            |
                  | data[398].is_autoapprove    | 1                                                                            |
                  | data[398].price             | 50000                                                                        |
                  | data[398].qrcodeenable      | 1                                                                            |
                  | data[398].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[398].reasonform_id     |                                                                              |
                  | data[398].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[398].is_smart_asset    | 1                                                                            |
                  | data[398].asset_type_id     | 1                                                                            |

                  | data[399].name              | AssetTest1                                                                   |
                  | data[399].description       | description1                                                                 |
                  | data[399].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[399].is_active         | 1                                                                            |
                  | data[399].is_autoapprove    | 1                                                                            |
                  | data[399].price             | 50000                                                                        |
                  | data[399].qrcodeenable      | 1                                                                            |
                  | data[399].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[399].reasonform_id     |                                                                              |
                  | data[399].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[399].is_smart_asset    | 1                                                                            |
                  | data[399].asset_type_id     | 1                                                                            |

                  | data[400].name              | AssetTest1                                                                   |
                  | data[400].description       | description1                                                                 |
                  | data[400].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[400].is_active         | 1                                                                            |
                  | data[400].is_autoapprove    | 1                                                                            |
                  | data[400].price             | 50000                                                                        |
                  | data[400].qrcodeenable      | 1                                                                            |
                  | data[400].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[400].reasonform_id     |                                                                              |
                  | data[400].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[400].is_smart_asset    | 1                                                                            |
                  | data[400].asset_type_id     | 1                                                                            |

                  | data[401].name              | AssetTest1                                                                   |
                  | data[401].description       | description1                                                                 |
                  | data[401].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[401].is_active         | 1                                                                            |
                  | data[401].is_autoapprove    | 1                                                                            |
                  | data[401].price             | 50000                                                                        |
                  | data[401].qrcodeenable      | 1                                                                            |
                  | data[401].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[401].reasonform_id     |                                                                              |
                  | data[401].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[401].is_smart_asset    | 1                                                                            |
                  | data[401].asset_type_id     | 1                                                                            |

                  | data[402].name              | AssetTest1                                                                   |
                  | data[402].description       | description1                                                                 |
                  | data[402].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[402].is_active         | 1                                                                            |
                  | data[402].is_autoapprove    | 1                                                                            |
                  | data[402].price             | 50000                                                                        |
                  | data[402].qrcodeenable      | 1                                                                            |
                  | data[402].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[402].reasonform_id     |                                                                              |
                  | data[402].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[402].is_smart_asset    | 1                                                                            |
                  | data[402].asset_type_id     | 1                                                                            |

                  | data[403].name              | AssetTest1                                                                   |
                  | data[403].description       | description1                                                                 |
                  | data[403].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[403].is_active         | 1                                                                            |
                  | data[403].is_autoapprove    | 1                                                                            |
                  | data[403].price             | 50000                                                                        |
                  | data[403].qrcodeenable      | 1                                                                            |
                  | data[403].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[403].reasonform_id     |                                                                              |
                  | data[403].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[403].is_smart_asset    | 1                                                                            |
                  | data[403].asset_type_id     | 1                                                                            |

                  | data[404].name              | AssetTest1                                                                   |
                  | data[404].description       | description1                                                                 |
                  | data[404].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[404].is_active         | 1                                                                            |
                  | data[404].is_autoapprove    | 1                                                                            |
                  | data[404].price             | 50000                                                                        |
                  | data[404].qrcodeenable      | 1                                                                            |
                  | data[404].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[404].reasonform_id     |                                                                              |
                  | data[404].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[404].is_smart_asset    | 1                                                                            |
                  | data[404].asset_type_id     | 1                                                                            |

                  | data[405].name              | AssetTest1                                                                   |
                  | data[405].description       | description1                                                                 |
                  | data[405].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[405].is_active         | 1                                                                            |
                  | data[405].is_autoapprove    | 1                                                                            |
                  | data[405].price             | 50000                                                                        |
                  | data[405].qrcodeenable      | 1                                                                            |
                  | data[405].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[405].reasonform_id     |                                                                              |
                  | data[405].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[405].is_smart_asset    | 1                                                                            |
                  | data[405].asset_type_id     | 1                                                                            |

                  | data[406].name              | AssetTest1                                                                   |
                  | data[406].description       | description1                                                                 |
                  | data[406].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[406].is_active         | 1                                                                            |
                  | data[406].is_autoapprove    | 1                                                                            |
                  | data[406].price             | 50000                                                                        |
                  | data[406].qrcodeenable      | 1                                                                            |
                  | data[406].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[406].reasonform_id     |                                                                              |
                  | data[406].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[406].is_smart_asset    | 1                                                                            |
                  | data[406].asset_type_id     | 1                                                                            |

                  | data[407].name              | AssetTest1                                                                   |
                  | data[407].description       | description1                                                                 |
                  | data[407].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[407].is_active         | 1                                                                            |
                  | data[407].is_autoapprove    | 1                                                                            |
                  | data[407].price             | 50000                                                                        |
                  | data[407].qrcodeenable      | 1                                                                            |
                  | data[407].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[407].reasonform_id     |                                                                              |
                  | data[407].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[407].is_smart_asset    | 1                                                                            |
                  | data[407].asset_type_id     | 1                                                                            |

                  | data[408].name              | AssetTest1                                                                   |
                  | data[408].description       | description1                                                                 |
                  | data[408].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[408].is_active         | 1                                                                            |
                  | data[408].is_autoapprove    | 1                                                                            |
                  | data[408].price             | 50000                                                                        |
                  | data[408].qrcodeenable      | 1                                                                            |
                  | data[408].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[408].reasonform_id     |                                                                              |
                  | data[408].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[408].is_smart_asset    | 1                                                                            |
                  | data[408].asset_type_id     | 1                                                                            |

                  | data[409].name              | AssetTest1                                                                   |
                  | data[409].description       | description1                                                                 |
                  | data[409].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[409].is_active         | 1                                                                            |
                  | data[409].is_autoapprove    | 1                                                                            |
                  | data[409].price             | 50000                                                                        |
                  | data[409].qrcodeenable      | 1                                                                            |
                  | data[409].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[409].reasonform_id     |                                                                              |
                  | data[409].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[409].is_smart_asset    | 1                                                                            |
                  | data[409].asset_type_id     | 1                                                                            |

                  | data[410].name              | AssetTest1                                                                   |
                  | data[410].description       | description1                                                                 |
                  | data[410].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[410].is_active         | 1                                                                            |
                  | data[410].is_autoapprove    | 1                                                                            |
                  | data[410].price             | 50000                                                                        |
                  | data[410].qrcodeenable      | 1                                                                            |
                  | data[410].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[410].reasonform_id     |                                                                              |
                  | data[410].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[410].is_smart_asset    | 1                                                                            |
                  | data[410].asset_type_id     | 1                                                                            |

                  | data[411].name              | AssetTest1                                                                   |
                  | data[411].description       | description1                                                                 |
                  | data[411].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[411].is_active         | 1                                                                            |
                  | data[411].is_autoapprove    | 1                                                                            |
                  | data[411].price             | 50000                                                                        |
                  | data[411].qrcodeenable      | 1                                                                            |
                  | data[411].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[411].reasonform_id     |                                                                              |
                  | data[411].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[411].is_smart_asset    | 1                                                                            |
                  | data[411].asset_type_id     | 1                                                                            |

                  | data[412].name              | AssetTest1                                                                   |
                  | data[412].description       | description1                                                                 |
                  | data[412].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[412].is_active         | 1                                                                            |
                  | data[412].is_autoapprove    | 1                                                                            |
                  | data[412].price             | 50000                                                                        |
                  | data[412].qrcodeenable      | 1                                                                            |
                  | data[412].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[412].reasonform_id     |                                                                              |
                  | data[412].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[412].is_smart_asset    | 1                                                                            |
                  | data[412].asset_type_id     | 1                                                                            |

                  | data[413].name              | AssetTest1                                                                   |
                  | data[413].description       | description1                                                                 |
                  | data[413].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[413].is_active         | 1                                                                            |
                  | data[413].is_autoapprove    | 1                                                                            |
                  | data[413].price             | 50000                                                                        |
                  | data[413].qrcodeenable      | 1                                                                            |
                  | data[413].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[413].reasonform_id     |                                                                              |
                  | data[413].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[413].is_smart_asset    | 1                                                                            |
                  | data[413].asset_type_id     | 1                                                                            |

                  | data[414].name              | AssetTest1                                                                   |
                  | data[414].description       | description1                                                                 |
                  | data[414].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[414].is_active         | 1                                                                            |
                  | data[414].is_autoapprove    | 1                                                                            |
                  | data[414].price             | 50000                                                                        |
                  | data[414].qrcodeenable      | 1                                                                            |
                  | data[414].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[414].reasonform_id     |                                                                              |
                  | data[414].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[414].is_smart_asset    | 1                                                                            |
                  | data[414].asset_type_id     | 1                                                                            |

                  | data[415].name              | AssetTest1                                                                   |
                  | data[415].description       | description1                                                                 |
                  | data[415].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[415].is_active         | 1                                                                            |
                  | data[415].is_autoapprove    | 1                                                                            |
                  | data[415].price             | 50000                                                                        |
                  | data[415].qrcodeenable      | 1                                                                            |
                  | data[415].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[415].reasonform_id     |                                                                              |
                  | data[415].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[415].is_smart_asset    | 1                                                                            |
                  | data[415].asset_type_id     | 1                                                                            |

                  | data[416].name              | AssetTest1                                                                   |
                  | data[416].description       | description1                                                                 |
                  | data[416].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[416].is_active         | 1                                                                            |
                  | data[416].is_autoapprove    | 1                                                                            |
                  | data[416].price             | 50000                                                                        |
                  | data[416].qrcodeenable      | 1                                                                            |
                  | data[416].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[416].reasonform_id     |                                                                              |
                  | data[416].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[416].is_smart_asset    | 1                                                                            |
                  | data[416].asset_type_id     | 1                                                                            |

                  | data[417].name              | AssetTest1                                                                   |
                  | data[417].description       | description1                                                                 |
                  | data[417].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[417].is_active         | 1                                                                            |
                  | data[417].is_autoapprove    | 1                                                                            |
                  | data[417].price             | 50000                                                                        |
                  | data[417].qrcodeenable      | 1                                                                            |
                  | data[417].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[417].reasonform_id     |                                                                              |
                  | data[417].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[417].is_smart_asset    | 1                                                                            |
                  | data[417].asset_type_id     | 1                                                                            |

                  | data[418].name              | AssetTest1                                                                   |
                  | data[418].description       | description1                                                                 |
                  | data[418].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[418].is_active         | 1                                                                            |
                  | data[418].is_autoapprove    | 1                                                                            |
                  | data[418].price             | 50000                                                                        |
                  | data[418].qrcodeenable      | 1                                                                            |
                  | data[418].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[418].reasonform_id     |                                                                              |
                  | data[418].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[418].is_smart_asset    | 1                                                                            |
                  | data[418].asset_type_id     | 1                                                                            |

                  | data[419].name              | AssetTest1                                                                   |
                  | data[419].description       | description1                                                                 |
                  | data[419].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[419].is_active         | 1                                                                            |
                  | data[419].is_autoapprove    | 1                                                                            |
                  | data[419].price             | 50000                                                                        |
                  | data[419].qrcodeenable      | 1                                                                            |
                  | data[419].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[419].reasonform_id     |                                                                              |
                  | data[419].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[419].is_smart_asset    | 1                                                                            |
                  | data[419].asset_type_id     | 1                                                                            |

                  | data[420].name              | AssetTest1                                                                   |
                  | data[420].description       | description1                                                                 |
                  | data[420].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[420].is_active         | 1                                                                            |
                  | data[420].is_autoapprove    | 1                                                                            |
                  | data[420].price             | 50000                                                                        |
                  | data[420].qrcodeenable      | 1                                                                            |
                  | data[420].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[420].reasonform_id     |                                                                              |
                  | data[420].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[420].is_smart_asset    | 1                                                                            |
                  | data[420].asset_type_id     | 1                                                                            |

                  | data[421].name              | AssetTest1                                                                   |
                  | data[421].description       | description1                                                                 |
                  | data[421].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[421].is_active         | 1                                                                            |
                  | data[421].is_autoapprove    | 1                                                                            |
                  | data[421].price             | 50000                                                                        |
                  | data[421].qrcodeenable      | 1                                                                            |
                  | data[421].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[421].reasonform_id     |                                                                              |
                  | data[421].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[421].is_smart_asset    | 1                                                                            |
                  | data[421].asset_type_id     | 1                                                                            |

                  | data[422].name              | AssetTest1                                                                   |
                  | data[422].description       | description1                                                                 |
                  | data[422].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[422].is_active         | 1                                                                            |
                  | data[422].is_autoapprove    | 1                                                                            |
                  | data[422].price             | 50000                                                                        |
                  | data[422].qrcodeenable      | 1                                                                            |
                  | data[422].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[422].reasonform_id     |                                                                              |
                  | data[422].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[422].is_smart_asset    | 1                                                                            |
                  | data[422].asset_type_id     | 1                                                                            |

                  | data[423].name              | AssetTest1                                                                   |
                  | data[423].description       | description1                                                                 |
                  | data[423].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[423].is_active         | 1                                                                            |
                  | data[423].is_autoapprove    | 1                                                                            |
                  | data[423].price             | 50000                                                                        |
                  | data[423].qrcodeenable      | 1                                                                            |
                  | data[423].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[423].reasonform_id     |                                                                              |
                  | data[423].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[423].is_smart_asset    | 1                                                                            |
                  | data[423].asset_type_id     | 1                                                                            |

                  | data[424].name              | AssetTest1                                                                   |
                  | data[424].description       | description1                                                                 |
                  | data[424].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[424].is_active         | 1                                                                            |
                  | data[424].is_autoapprove    | 1                                                                            |
                  | data[424].price             | 50000                                                                        |
                  | data[424].qrcodeenable      | 1                                                                            |
                  | data[424].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[424].reasonform_id     |                                                                              |
                  | data[424].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[424].is_smart_asset    | 1                                                                            |
                  | data[424].asset_type_id     | 1                                                                            |

                  | data[425].name              | AssetTest1                                                                   |
                  | data[425].description       | description1                                                                 |
                  | data[425].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[425].is_active         | 1                                                                            |
                  | data[425].is_autoapprove    | 1                                                                            |
                  | data[425].price             | 50000                                                                        |
                  | data[425].qrcodeenable      | 1                                                                            |
                  | data[425].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[425].reasonform_id     |                                                                              |
                  | data[425].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[425].is_smart_asset    | 1                                                                            |
                  | data[425].asset_type_id     | 1                                                                            |

                  | data[426].name              | AssetTest1                                                                   |
                  | data[426].description       | description1                                                                 |
                  | data[426].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[426].is_active         | 1                                                                            |
                  | data[426].is_autoapprove    | 1                                                                            |
                  | data[426].price             | 50000                                                                        |
                  | data[426].qrcodeenable      | 1                                                                            |
                  | data[426].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[426].reasonform_id     |                                                                              |
                  | data[426].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[426].is_smart_asset    | 1                                                                            |
                  | data[426].asset_type_id     | 1                                                                            |

                  | data[427].name              | AssetTest1                                                                   |
                  | data[427].description       | description1                                                                 |
                  | data[427].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[427].is_active         | 1                                                                            |
                  | data[427].is_autoapprove    | 1                                                                            |
                  | data[427].price             | 50000                                                                        |
                  | data[427].qrcodeenable      | 1                                                                            |
                  | data[427].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[427].reasonform_id     |                                                                              |
                  | data[427].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[427].is_smart_asset    | 1                                                                            |
                  | data[427].asset_type_id     | 1                                                                            |

                  | data[428].name              | AssetTest1                                                                   |
                  | data[428].description       | description1                                                                 |
                  | data[428].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[428].is_active         | 1                                                                            |
                  | data[428].is_autoapprove    | 1                                                                            |
                  | data[428].price             | 50000                                                                        |
                  | data[428].qrcodeenable      | 1                                                                            |
                  | data[428].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[428].reasonform_id     |                                                                              |
                  | data[428].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[428].is_smart_asset    | 1                                                                            |
                  | data[428].asset_type_id     | 1                                                                            |

                  | data[429].name              | AssetTest1                                                                   |
                  | data[429].description       | description1                                                                 |
                  | data[429].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[429].is_active         | 1                                                                            |
                  | data[429].is_autoapprove    | 1                                                                            |
                  | data[429].price             | 50000                                                                        |
                  | data[429].qrcodeenable      | 1                                                                            |
                  | data[429].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[429].reasonform_id     |                                                                              |
                  | data[429].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[429].is_smart_asset    | 1                                                                            |
                  | data[429].asset_type_id     | 1                                                                            |

                  | data[430].name              | AssetTest1                                                                   |
                  | data[430].description       | description1                                                                 |
                  | data[430].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[430].is_active         | 1                                                                            |
                  | data[430].is_autoapprove    | 1                                                                            |
                  | data[430].price             | 50000                                                                        |
                  | data[430].qrcodeenable      | 1                                                                            |
                  | data[430].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[430].reasonform_id     |                                                                              |
                  | data[430].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[430].is_smart_asset    | 1                                                                            |
                  | data[430].asset_type_id     | 1                                                                            |

                  | data[431].name              | AssetTest1                                                                   |
                  | data[431].description       | description1                                                                 |
                  | data[431].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[431].is_active         | 1                                                                            |
                  | data[431].is_autoapprove    | 1                                                                            |
                  | data[431].price             | 50000                                                                        |
                  | data[431].qrcodeenable      | 1                                                                            |
                  | data[431].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[431].reasonform_id     |                                                                              |
                  | data[431].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[431].is_smart_asset    | 1                                                                            |
                  | data[431].asset_type_id     | 1                                                                            |

                  | data[432].name              | AssetTest1                                                                   |
                  | data[432].description       | description1                                                                 |
                  | data[432].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[432].is_active         | 1                                                                            |
                  | data[432].is_autoapprove    | 1                                                                            |
                  | data[432].price             | 50000                                                                        |
                  | data[432].qrcodeenable      | 1                                                                            |
                  | data[432].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[432].reasonform_id     |                                                                              |
                  | data[432].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[432].is_smart_asset    | 1                                                                            |
                  | data[432].asset_type_id     | 1                                                                            |

                  | data[433].name              | AssetTest1                                                                   |
                  | data[433].description       | description1                                                                 |
                  | data[433].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[433].is_active         | 1                                                                            |
                  | data[433].is_autoapprove    | 1                                                                            |
                  | data[433].price             | 50000                                                                        |
                  | data[433].qrcodeenable      | 1                                                                            |
                  | data[433].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[433].reasonform_id     |                                                                              |
                  | data[433].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[433].is_smart_asset    | 1                                                                            |
                  | data[433].asset_type_id     | 1                                                                            |

                  | data[434].name              | AssetTest1                                                                   |
                  | data[434].description       | description1                                                                 |
                  | data[434].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[434].is_active         | 1                                                                            |
                  | data[434].is_autoapprove    | 1                                                                            |
                  | data[434].price             | 50000                                                                        |
                  | data[434].qrcodeenable      | 1                                                                            |
                  | data[434].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[434].reasonform_id     |                                                                              |
                  | data[434].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[434].is_smart_asset    | 1                                                                            |
                  | data[434].asset_type_id     | 1                                                                            |

                  | data[435].name              | AssetTest1                                                                   |
                  | data[435].description       | description1                                                                 |
                  | data[435].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[435].is_active         | 1                                                                            |
                  | data[435].is_autoapprove    | 1                                                                            |
                  | data[435].price             | 50000                                                                        |
                  | data[435].qrcodeenable      | 1                                                                            |
                  | data[435].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[435].reasonform_id     |                                                                              |
                  | data[435].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[435].is_smart_asset    | 1                                                                            |
                  | data[435].asset_type_id     | 1                                                                            |

                  | data[436].name              | AssetTest1                                                                   |
                  | data[436].description       | description1                                                                 |
                  | data[436].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[436].is_active         | 1                                                                            |
                  | data[436].is_autoapprove    | 1                                                                            |
                  | data[436].price             | 50000                                                                        |
                  | data[436].qrcodeenable      | 1                                                                            |
                  | data[436].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[436].reasonform_id     |                                                                              |
                  | data[436].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[436].is_smart_asset    | 1                                                                            |
                  | data[436].asset_type_id     | 1                                                                            |

                  | data[437].name              | AssetTest1                                                                   |
                  | data[437].description       | description1                                                                 |
                  | data[437].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[437].is_active         | 1                                                                            |
                  | data[437].is_autoapprove    | 1                                                                            |
                  | data[437].price             | 50000                                                                        |
                  | data[437].qrcodeenable      | 1                                                                            |
                  | data[437].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[437].reasonform_id     |                                                                              |
                  | data[437].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[437].is_smart_asset    | 1                                                                            |
                  | data[437].asset_type_id     | 1                                                                            |

                  | data[438].name              | AssetTest1                                                                   |
                  | data[438].description       | description1                                                                 |
                  | data[438].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[438].is_active         | 1                                                                            |
                  | data[438].is_autoapprove    | 1                                                                            |
                  | data[438].price             | 50000                                                                        |
                  | data[438].qrcodeenable      | 1                                                                            |
                  | data[438].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[438].reasonform_id     |                                                                              |
                  | data[438].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[438].is_smart_asset    | 1                                                                            |
                  | data[438].asset_type_id     | 1                                                                            |

                  | data[439].name              | AssetTest1                                                                   |
                  | data[439].description       | description1                                                                 |
                  | data[439].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[439].is_active         | 1                                                                            |
                  | data[439].is_autoapprove    | 1                                                                            |
                  | data[439].price             | 50000                                                                        |
                  | data[439].qrcodeenable      | 1                                                                            |
                  | data[439].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[439].reasonform_id     |                                                                              |
                  | data[439].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[439].is_smart_asset    | 1                                                                            |
                  | data[439].asset_type_id     | 1                                                                            |

                  | data[440].name              | AssetTest1                                                                   |
                  | data[440].description       | description1                                                                 |
                  | data[440].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[440].is_active         | 1                                                                            |
                  | data[440].is_autoapprove    | 1                                                                            |
                  | data[440].price             | 50000                                                                        |
                  | data[440].qrcodeenable      | 1                                                                            |
                  | data[440].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[440].reasonform_id     |                                                                              |
                  | data[440].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[440].is_smart_asset    | 1                                                                            |
                  | data[440].asset_type_id     | 1                                                                            |

                  | data[441].name              | AssetTest1                                                                   |
                  | data[441].description       | description1                                                                 |
                  | data[441].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[441].is_active         | 1                                                                            |
                  | data[441].is_autoapprove    | 1                                                                            |
                  | data[441].price             | 50000                                                                        |
                  | data[441].qrcodeenable      | 1                                                                            |
                  | data[441].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[441].reasonform_id     |                                                                              |
                  | data[441].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[441].is_smart_asset    | 1                                                                            |
                  | data[441].asset_type_id     | 1                                                                            |

                  | data[442].name              | AssetTest1                                                                   |
                  | data[442].description       | description1                                                                 |
                  | data[442].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[442].is_active         | 1                                                                            |
                  | data[442].is_autoapprove    | 1                                                                            |
                  | data[442].price             | 50000                                                                        |
                  | data[442].qrcodeenable      | 1                                                                            |
                  | data[442].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[442].reasonform_id     |                                                                              |
                  | data[442].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[442].is_smart_asset    | 1                                                                            |
                  | data[442].asset_type_id     | 1                                                                            |

                  | data[443].name              | AssetTest1                                                                   |
                  | data[443].description       | description1                                                                 |
                  | data[443].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[443].is_active         | 1                                                                            |
                  | data[443].is_autoapprove    | 1                                                                            |
                  | data[443].price             | 50000                                                                        |
                  | data[443].qrcodeenable      | 1                                                                            |
                  | data[443].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[443].reasonform_id     |                                                                              |
                  | data[443].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[443].is_smart_asset    | 1                                                                            |
                  | data[443].asset_type_id     | 1                                                                            |

                  | data[444].name              | AssetTest1                                                                   |
                  | data[444].description       | description1                                                                 |
                  | data[444].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[444].is_active         | 1                                                                            |
                  | data[444].is_autoapprove    | 1                                                                            |
                  | data[444].price             | 50000                                                                        |
                  | data[444].qrcodeenable      | 1                                                                            |
                  | data[444].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[444].reasonform_id     |                                                                              |
                  | data[444].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[444].is_smart_asset    | 1                                                                            |
                  | data[444].asset_type_id     | 1                                                                            |

                  | data[445].name              | AssetTest1                                                                   |
                  | data[445].description       | description1                                                                 |
                  | data[445].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[445].is_active         | 1                                                                            |
                  | data[445].is_autoapprove    | 1                                                                            |
                  | data[445].price             | 50000                                                                        |
                  | data[445].qrcodeenable      | 1                                                                            |
                  | data[445].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[445].reasonform_id     |                                                                              |
                  | data[445].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[445].is_smart_asset    | 1                                                                            |
                  | data[445].asset_type_id     | 1                                                                            |

                  | data[446].name              | AssetTest1                                                                   |
                  | data[446].description       | description1                                                                 |
                  | data[446].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[446].is_active         | 1                                                                            |
                  | data[446].is_autoapprove    | 1                                                                            |
                  | data[446].price             | 50000                                                                        |
                  | data[446].qrcodeenable      | 1                                                                            |
                  | data[446].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[446].reasonform_id     |                                                                              |
                  | data[446].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[446].is_smart_asset    | 1                                                                            |
                  | data[446].asset_type_id     | 1                                                                            |

                  | data[447].name              | AssetTest1                                                                   |
                  | data[447].description       | description1                                                                 |
                  | data[447].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[447].is_active         | 1                                                                            |
                  | data[447].is_autoapprove    | 1                                                                            |
                  | data[447].price             | 50000                                                                        |
                  | data[447].qrcodeenable      | 1                                                                            |
                  | data[447].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[447].reasonform_id     |                                                                              |
                  | data[447].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[447].is_smart_asset    | 1                                                                            |
                  | data[447].asset_type_id     | 1                                                                            |

                  | data[448].name              | AssetTest1                                                                   |
                  | data[448].description       | description1                                                                 |
                  | data[448].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[448].is_active         | 1                                                                            |
                  | data[448].is_autoapprove    | 1                                                                            |
                  | data[448].price             | 50000                                                                        |
                  | data[448].qrcodeenable      | 1                                                                            |
                  | data[448].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[448].reasonform_id     |                                                                              |
                  | data[448].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[448].is_smart_asset    | 1                                                                            |
                  | data[448].asset_type_id     | 1                                                                            |

                  | data[449].name              | AssetTest1                                                                   |
                  | data[449].description       | description1                                                                 |
                  | data[449].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[449].is_active         | 1                                                                            |
                  | data[449].is_autoapprove    | 1                                                                            |
                  | data[449].price             | 50000                                                                        |
                  | data[449].qrcodeenable      | 1                                                                            |
                  | data[449].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[449].reasonform_id     |                                                                              |
                  | data[449].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[449].is_smart_asset    | 1                                                                            |
                  | data[449].asset_type_id     | 1                                                                            |

                  | data[450].name              | AssetTest1                                                                   |
                  | data[450].description       | description1                                                                 |
                  | data[450].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[450].is_active         | 1                                                                            |
                  | data[450].is_autoapprove    | 1                                                                            |
                  | data[450].price             | 50000                                                                        |
                  | data[450].qrcodeenable      | 1                                                                            |
                  | data[450].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[450].reasonform_id     |                                                                              |
                  | data[450].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[450].is_smart_asset    | 1                                                                            |
                  | data[450].asset_type_id     | 1                                                                            |

                  | data[451].name              | AssetTest1                                                                   |
                  | data[451].description       | description1                                                                 |
                  | data[451].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[451].is_active         | 1                                                                            |
                  | data[451].is_autoapprove    | 1                                                                            |
                  | data[451].price             | 50000                                                                        |
                  | data[451].qrcodeenable      | 1                                                                            |
                  | data[451].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[451].reasonform_id     |                                                                              |
                  | data[451].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[451].is_smart_asset    | 1                                                                            |
                  | data[451].asset_type_id     | 1                                                                            |

                  | data[452].name              | AssetTest1                                                                   |
                  | data[452].description       | description1                                                                 |
                  | data[452].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[452].is_active         | 1                                                                            |
                  | data[452].is_autoapprove    | 1                                                                            |
                  | data[452].price             | 50000                                                                        |
                  | data[452].qrcodeenable      | 1                                                                            |
                  | data[452].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[452].reasonform_id     |                                                                              |
                  | data[452].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[452].is_smart_asset    | 1                                                                            |
                  | data[452].asset_type_id     | 1                                                                            |

                  | data[453].name              | AssetTest1                                                                   |
                  | data[453].description       | description1                                                                 |
                  | data[453].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[453].is_active         | 1                                                                            |
                  | data[453].is_autoapprove    | 1                                                                            |
                  | data[453].price             | 50000                                                                        |
                  | data[453].qrcodeenable      | 1                                                                            |
                  | data[453].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[453].reasonform_id     |                                                                              |
                  | data[453].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[453].is_smart_asset    | 1                                                                            |
                  | data[453].asset_type_id     | 1                                                                            |

                  | data[454].name              | AssetTest1                                                                   |
                  | data[454].description       | description1                                                                 |
                  | data[454].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[454].is_active         | 1                                                                            |
                  | data[454].is_autoapprove    | 1                                                                            |
                  | data[454].price             | 50000                                                                        |
                  | data[454].qrcodeenable      | 1                                                                            |
                  | data[454].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[454].reasonform_id     |                                                                              |
                  | data[454].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[454].is_smart_asset    | 1                                                                            |
                  | data[454].asset_type_id     | 1                                                                            |

                  | data[455].name              | AssetTest1                                                                   |
                  | data[455].description       | description1                                                                 |
                  | data[455].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[455].is_active         | 1                                                                            |
                  | data[455].is_autoapprove    | 1                                                                            |
                  | data[455].price             | 50000                                                                        |
                  | data[455].qrcodeenable      | 1                                                                            |
                  | data[455].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[455].reasonform_id     |                                                                              |
                  | data[455].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[455].is_smart_asset    | 1                                                                            |
                  | data[455].asset_type_id     | 1                                                                            |

                  | data[456].name              | AssetTest1                                                                   |
                  | data[456].description       | description1                                                                 |
                  | data[456].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[456].is_active         | 1                                                                            |
                  | data[456].is_autoapprove    | 1                                                                            |
                  | data[456].price             | 50000                                                                        |
                  | data[456].qrcodeenable      | 1                                                                            |
                  | data[456].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[456].reasonform_id     |                                                                              |
                  | data[456].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[456].is_smart_asset    | 1                                                                            |
                  | data[456].asset_type_id     | 1                                                                            |

                  | data[457].name              | AssetTest1                                                                   |
                  | data[457].description       | description1                                                                 |
                  | data[457].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[457].is_active         | 1                                                                            |
                  | data[457].is_autoapprove    | 1                                                                            |
                  | data[457].price             | 50000                                                                        |
                  | data[457].qrcodeenable      | 1                                                                            |
                  | data[457].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[457].reasonform_id     |                                                                              |
                  | data[457].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[457].is_smart_asset    | 1                                                                            |
                  | data[457].asset_type_id     | 1                                                                            |

                  | data[458].name              | AssetTest1                                                                   |
                  | data[458].description       | description1                                                                 |
                  | data[458].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[458].is_active         | 1                                                                            |
                  | data[458].is_autoapprove    | 1                                                                            |
                  | data[458].price             | 50000                                                                        |
                  | data[458].qrcodeenable      | 1                                                                            |
                  | data[458].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[458].reasonform_id     |                                                                              |
                  | data[458].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[458].is_smart_asset    | 1                                                                            |
                  | data[458].asset_type_id     | 1                                                                            |

                  | data[459].name              | AssetTest1                                                                   |
                  | data[459].description       | description1                                                                 |
                  | data[459].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[459].is_active         | 1                                                                            |
                  | data[459].is_autoapprove    | 1                                                                            |
                  | data[459].price             | 50000                                                                        |
                  | data[459].qrcodeenable      | 1                                                                            |
                  | data[459].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[459].reasonform_id     |                                                                              |
                  | data[459].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[459].is_smart_asset    | 1                                                                            |
                  | data[459].asset_type_id     | 1                                                                            |

                  | data[460].name              | AssetTest1                                                                   |
                  | data[460].description       | description1                                                                 |
                  | data[460].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[460].is_active         | 1                                                                            |
                  | data[460].is_autoapprove    | 1                                                                            |
                  | data[460].price             | 50000                                                                        |
                  | data[460].qrcodeenable      | 1                                                                            |
                  | data[460].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[460].reasonform_id     |                                                                              |
                  | data[460].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[460].is_smart_asset    | 1                                                                            |
                  | data[460].asset_type_id     | 1                                                                            |

                  | data[461].name              | AssetTest1                                                                   |
                  | data[461].description       | description1                                                                 |
                  | data[461].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[461].is_active         | 1                                                                            |
                  | data[461].is_autoapprove    | 1                                                                            |
                  | data[461].price             | 50000                                                                        |
                  | data[461].qrcodeenable      | 1                                                                            |
                  | data[461].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[461].reasonform_id     |                                                                              |
                  | data[461].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[461].is_smart_asset    | 1                                                                            |
                  | data[461].asset_type_id     | 1                                                                            |

                  | data[462].name              | AssetTest1                                                                   |
                  | data[462].description       | description1                                                                 |
                  | data[462].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[462].is_active         | 1                                                                            |
                  | data[462].is_autoapprove    | 1                                                                            |
                  | data[462].price             | 50000                                                                        |
                  | data[462].qrcodeenable      | 1                                                                            |
                  | data[462].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[462].reasonform_id     |                                                                              |
                  | data[462].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[462].is_smart_asset    | 1                                                                            |
                  | data[462].asset_type_id     | 1                                                                            |

                  | data[463].name              | AssetTest1                                                                   |
                  | data[463].description       | description1                                                                 |
                  | data[463].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[463].is_active         | 1                                                                            |
                  | data[463].is_autoapprove    | 1                                                                            |
                  | data[463].price             | 50000                                                                        |
                  | data[463].qrcodeenable      | 1                                                                            |
                  | data[463].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[463].reasonform_id     |                                                                              |
                  | data[463].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[463].is_smart_asset    | 1                                                                            |
                  | data[463].asset_type_id     | 1                                                                            |

                  | data[464].name              | AssetTest1                                                                   |
                  | data[464].description       | description1                                                                 |
                  | data[464].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[464].is_active         | 1                                                                            |
                  | data[464].is_autoapprove    | 1                                                                            |
                  | data[464].price             | 50000                                                                        |
                  | data[464].qrcodeenable      | 1                                                                            |
                  | data[464].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[464].reasonform_id     |                                                                              |
                  | data[464].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[464].is_smart_asset    | 1                                                                            |
                  | data[464].asset_type_id     | 1                                                                            |

                  | data[465].name              | AssetTest1                                                                   |
                  | data[465].description       | description1                                                                 |
                  | data[465].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[465].is_active         | 1                                                                            |
                  | data[465].is_autoapprove    | 1                                                                            |
                  | data[465].price             | 50000                                                                        |
                  | data[465].qrcodeenable      | 1                                                                            |
                  | data[465].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[465].reasonform_id     |                                                                              |
                  | data[465].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[465].is_smart_asset    | 1                                                                            |
                  | data[465].asset_type_id     | 1                                                                            |

                  | data[466].name              | AssetTest1                                                                   |
                  | data[466].description       | description1                                                                 |
                  | data[466].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[466].is_active         | 1                                                                            |
                  | data[466].is_autoapprove    | 1                                                                            |
                  | data[466].price             | 50000                                                                        |
                  | data[466].qrcodeenable      | 1                                                                            |
                  | data[466].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[466].reasonform_id     |                                                                              |
                  | data[466].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[466].is_smart_asset    | 1                                                                            |
                  | data[466].asset_type_id     | 1                                                                            |

                  | data[467].name              | AssetTest1                                                                   |
                  | data[467].description       | description1                                                                 |
                  | data[467].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[467].is_active         | 1                                                                            |
                  | data[467].is_autoapprove    | 1                                                                            |
                  | data[467].price             | 50000                                                                        |
                  | data[467].qrcodeenable      | 1                                                                            |
                  | data[467].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[467].reasonform_id     |                                                                              |
                  | data[467].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[467].is_smart_asset    | 1                                                                            |
                  | data[467].asset_type_id     | 1                                                                            |

                  | data[468].name              | AssetTest1                                                                   |
                  | data[468].description       | description1                                                                 |
                  | data[468].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[468].is_active         | 1                                                                            |
                  | data[468].is_autoapprove    | 1                                                                            |
                  | data[468].price             | 50000                                                                        |
                  | data[468].qrcodeenable      | 1                                                                            |
                  | data[468].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[468].reasonform_id     |                                                                              |
                  | data[468].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[468].is_smart_asset    | 1                                                                            |
                  | data[468].asset_type_id     | 1                                                                            |

                  | data[469].name              | AssetTest1                                                                   |
                  | data[469].description       | description1                                                                 |
                  | data[469].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[469].is_active         | 1                                                                            |
                  | data[469].is_autoapprove    | 1                                                                            |
                  | data[469].price             | 50000                                                                        |
                  | data[469].qrcodeenable      | 1                                                                            |
                  | data[469].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[469].reasonform_id     |                                                                              |
                  | data[469].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[469].is_smart_asset    | 1                                                                            |
                  | data[469].asset_type_id     | 1                                                                            |

                  | data[470].name              | AssetTest1                                                                   |
                  | data[470].description       | description1                                                                 |
                  | data[470].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[470].is_active         | 1                                                                            |
                  | data[470].is_autoapprove    | 1                                                                            |
                  | data[470].price             | 50000                                                                        |
                  | data[470].qrcodeenable      | 1                                                                            |
                  | data[470].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[470].reasonform_id     |                                                                              |
                  | data[470].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[470].is_smart_asset    | 1                                                                            |
                  | data[470].asset_type_id     | 1                                                                            |

                  | data[471].name              | AssetTest1                                                                   |
                  | data[471].description       | description1                                                                 |
                  | data[471].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[471].is_active         | 1                                                                            |
                  | data[471].is_autoapprove    | 1                                                                            |
                  | data[471].price             | 50000                                                                        |
                  | data[471].qrcodeenable      | 1                                                                            |
                  | data[471].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[471].reasonform_id     |                                                                              |
                  | data[471].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[471].is_smart_asset    | 1                                                                            |
                  | data[471].asset_type_id     | 1                                                                            |

                  | data[472].name              | AssetTest1                                                                   |
                  | data[472].description       | description1                                                                 |
                  | data[472].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[472].is_active         | 1                                                                            |
                  | data[472].is_autoapprove    | 1                                                                            |
                  | data[472].price             | 50000                                                                        |
                  | data[472].qrcodeenable      | 1                                                                            |
                  | data[472].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[472].reasonform_id     |                                                                              |
                  | data[472].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[472].is_smart_asset    | 1                                                                            |
                  | data[472].asset_type_id     | 1                                                                            |

                  | data[473].name              | AssetTest1                                                                   |
                  | data[473].description       | description1                                                                 |
                  | data[473].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[473].is_active         | 1                                                                            |
                  | data[473].is_autoapprove    | 1                                                                            |
                  | data[473].price             | 50000                                                                        |
                  | data[473].qrcodeenable      | 1                                                                            |
                  | data[473].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[473].reasonform_id     |                                                                              |
                  | data[473].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[473].is_smart_asset    | 1                                                                            |
                  | data[473].asset_type_id     | 1                                                                            |

                  | data[474].name              | AssetTest1                                                                   |
                  | data[474].description       | description1                                                                 |
                  | data[474].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[474].is_active         | 1                                                                            |
                  | data[474].is_autoapprove    | 1                                                                            |
                  | data[474].price             | 50000                                                                        |
                  | data[474].qrcodeenable      | 1                                                                            |
                  | data[474].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[474].reasonform_id     |                                                                              |
                  | data[474].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[474].is_smart_asset    | 1                                                                            |
                  | data[474].asset_type_id     | 1                                                                            |

                  | data[475].name              | AssetTest1                                                                   |
                  | data[475].description       | description1                                                                 |
                  | data[475].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[475].is_active         | 1                                                                            |
                  | data[475].is_autoapprove    | 1                                                                            |
                  | data[475].price             | 50000                                                                        |
                  | data[475].qrcodeenable      | 1                                                                            |
                  | data[475].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[475].reasonform_id     |                                                                              |
                  | data[475].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[475].is_smart_asset    | 1                                                                            |
                  | data[475].asset_type_id     | 1                                                                            |

                  | data[476].name              | AssetTest1                                                                   |
                  | data[476].description       | description1                                                                 |
                  | data[476].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[476].is_active         | 1                                                                            |
                  | data[476].is_autoapprove    | 1                                                                            |
                  | data[476].price             | 50000                                                                        |
                  | data[476].qrcodeenable      | 1                                                                            |
                  | data[476].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[476].reasonform_id     |                                                                              |
                  | data[476].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[476].is_smart_asset    | 1                                                                            |
                  | data[476].asset_type_id     | 1                                                                            |

                  | data[477].name              | AssetTest1                                                                   |
                  | data[477].description       | description1                                                                 |
                  | data[477].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[477].is_active         | 1                                                                            |
                  | data[477].is_autoapprove    | 1                                                                            |
                  | data[477].price             | 50000                                                                        |
                  | data[477].qrcodeenable      | 1                                                                            |
                  | data[477].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[477].reasonform_id     |                                                                              |
                  | data[477].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[477].is_smart_asset    | 1                                                                            |
                  | data[477].asset_type_id     | 1                                                                            |

                  | data[478].name              | AssetTest1                                                                   |
                  | data[478].description       | description1                                                                 |
                  | data[478].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[478].is_active         | 1                                                                            |
                  | data[478].is_autoapprove    | 1                                                                            |
                  | data[478].price             | 50000                                                                        |
                  | data[478].qrcodeenable      | 1                                                                            |
                  | data[478].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[478].reasonform_id     |                                                                              |
                  | data[478].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[478].is_smart_asset    | 1                                                                            |
                  | data[478].asset_type_id     | 1                                                                            |

                  | data[479].name              | AssetTest1                                                                   |
                  | data[479].description       | description1                                                                 |
                  | data[479].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[479].is_active         | 1                                                                            |
                  | data[479].is_autoapprove    | 1                                                                            |
                  | data[479].price             | 50000                                                                        |
                  | data[479].qrcodeenable      | 1                                                                            |
                  | data[479].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[479].reasonform_id     |                                                                              |
                  | data[479].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[479].is_smart_asset    | 1                                                                            |
                  | data[479].asset_type_id     | 1                                                                            |

                  | data[480].name              | AssetTest1                                                                   |
                  | data[480].description       | description1                                                                 |
                  | data[480].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[480].is_active         | 1                                                                            |
                  | data[480].is_autoapprove    | 1                                                                            |
                  | data[480].price             | 50000                                                                        |
                  | data[480].qrcodeenable      | 1                                                                            |
                  | data[480].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[480].reasonform_id     |                                                                              |
                  | data[480].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[480].is_smart_asset    | 1                                                                            |
                  | data[480].asset_type_id     | 1                                                                            |

                  | data[481].name              | AssetTest1                                                                   |
                  | data[481].description       | description1                                                                 |
                  | data[481].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[481].is_active         | 1                                                                            |
                  | data[481].is_autoapprove    | 1                                                                            |
                  | data[481].price             | 50000                                                                        |
                  | data[481].qrcodeenable      | 1                                                                            |
                  | data[481].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[481].reasonform_id     |                                                                              |
                  | data[481].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[481].is_smart_asset    | 1                                                                            |
                  | data[481].asset_type_id     | 1                                                                            |

                  | data[482].name              | AssetTest1                                                                   |
                  | data[482].description       | description1                                                                 |
                  | data[482].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[482].is_active         | 1                                                                            |
                  | data[482].is_autoapprove    | 1                                                                            |
                  | data[482].price             | 50000                                                                        |
                  | data[482].qrcodeenable      | 1                                                                            |
                  | data[482].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[482].reasonform_id     |                                                                              |
                  | data[482].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[482].is_smart_asset    | 1                                                                            |
                  | data[482].asset_type_id     | 1                                                                            |

                  | data[483].name              | AssetTest1                                                                   |
                  | data[483].description       | description1                                                                 |
                  | data[483].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[483].is_active         | 1                                                                            |
                  | data[483].is_autoapprove    | 1                                                                            |
                  | data[483].price             | 50000                                                                        |
                  | data[483].qrcodeenable      | 1                                                                            |
                  | data[483].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[483].reasonform_id     |                                                                              |
                  | data[483].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[483].is_smart_asset    | 1                                                                            |
                  | data[483].asset_type_id     | 1                                                                            |

                  | data[484].name              | AssetTest1                                                                   |
                  | data[484].description       | description1                                                                 |
                  | data[484].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[484].is_active         | 1                                                                            |
                  | data[484].is_autoapprove    | 1                                                                            |
                  | data[484].price             | 50000                                                                        |
                  | data[484].qrcodeenable      | 1                                                                            |
                  | data[484].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[484].reasonform_id     |                                                                              |
                  | data[484].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[484].is_smart_asset    | 1                                                                            |
                  | data[484].asset_type_id     | 1                                                                            |

                  | data[485].name              | AssetTest1                                                                   |
                  | data[485].description       | description1                                                                 |
                  | data[485].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[485].is_active         | 1                                                                            |
                  | data[485].is_autoapprove    | 1                                                                            |
                  | data[485].price             | 50000                                                                        |
                  | data[485].qrcodeenable      | 1                                                                            |
                  | data[485].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[485].reasonform_id     |                                                                              |
                  | data[485].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[485].is_smart_asset    | 1                                                                            |
                  | data[485].asset_type_id     | 1                                                                            |

                  | data[486].name              | AssetTest1                                                                   |
                  | data[486].description       | description1                                                                 |
                  | data[486].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[486].is_active         | 1                                                                            |
                  | data[486].is_autoapprove    | 1                                                                            |
                  | data[486].price             | 50000                                                                        |
                  | data[486].qrcodeenable      | 1                                                                            |
                  | data[486].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[486].reasonform_id     |                                                                              |
                  | data[486].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[486].is_smart_asset    | 1                                                                            |
                  | data[486].asset_type_id     | 1                                                                            |

                  | data[487].name              | AssetTest1                                                                   |
                  | data[487].description       | description1                                                                 |
                  | data[487].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[487].is_active         | 1                                                                            |
                  | data[487].is_autoapprove    | 1                                                                            |
                  | data[487].price             | 50000                                                                        |
                  | data[487].qrcodeenable      | 1                                                                            |
                  | data[487].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[487].reasonform_id     |                                                                              |
                  | data[487].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[487].is_smart_asset    | 1                                                                            |
                  | data[487].asset_type_id     | 1                                                                            |

                  | data[488].name              | AssetTest1                                                                   |
                  | data[488].description       | description1                                                                 |
                  | data[488].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[488].is_active         | 1                                                                            |
                  | data[488].is_autoapprove    | 1                                                                            |
                  | data[488].price             | 50000                                                                        |
                  | data[488].qrcodeenable      | 1                                                                            |
                  | data[488].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[488].reasonform_id     |                                                                              |
                  | data[488].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[488].is_smart_asset    | 1                                                                            |
                  | data[488].asset_type_id     | 1                                                                            |

                  | data[489].name              | AssetTest1                                                                   |
                  | data[489].description       | description1                                                                 |
                  | data[489].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[489].is_active         | 1                                                                            |
                  | data[489].is_autoapprove    | 1                                                                            |
                  | data[489].price             | 50000                                                                        |
                  | data[489].qrcodeenable      | 1                                                                            |
                  | data[489].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[489].reasonform_id     |                                                                              |
                  | data[489].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[489].is_smart_asset    | 1                                                                            |
                  | data[489].asset_type_id     | 1                                                                            |

                  | data[490].name              | AssetTest1                                                                   |
                  | data[490].description       | description1                                                                 |
                  | data[490].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[490].is_active         | 1                                                                            |
                  | data[490].is_autoapprove    | 1                                                                            |
                  | data[490].price             | 50000                                                                        |
                  | data[490].qrcodeenable      | 1                                                                            |
                  | data[490].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[490].reasonform_id     |                                                                              |
                  | data[490].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[490].is_smart_asset    | 1                                                                            |
                  | data[490].asset_type_id     | 1                                                                            |

                  | data[491].name              | AssetTest1                                                                   |
                  | data[491].description       | description1                                                                 |
                  | data[491].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[491].is_active         | 1                                                                            |
                  | data[491].is_autoapprove    | 1                                                                            |
                  | data[491].price             | 50000                                                                        |
                  | data[491].qrcodeenable      | 1                                                                            |
                  | data[491].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[491].reasonform_id     |                                                                              |
                  | data[491].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[491].is_smart_asset    | 1                                                                            |
                  | data[491].asset_type_id     | 1                                                                            |

                  | data[492].name              | AssetTest1                                                                   |
                  | data[492].description       | description1                                                                 |
                  | data[492].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[492].is_active         | 1                                                                            |
                  | data[492].is_autoapprove    | 1                                                                            |
                  | data[492].price             | 50000                                                                        |
                  | data[492].qrcodeenable      | 1                                                                            |
                  | data[492].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[492].reasonform_id     |                                                                              |
                  | data[492].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[492].is_smart_asset    | 1                                                                            |
                  | data[492].asset_type_id     | 1                                                                            |

                  | data[493].name              | AssetTest1                                                                   |
                  | data[493].description       | description1                                                                 |
                  | data[493].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[493].is_active         | 1                                                                            |
                  | data[493].is_autoapprove    | 1                                                                            |
                  | data[493].price             | 50000                                                                        |
                  | data[493].qrcodeenable      | 1                                                                            |
                  | data[493].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[493].reasonform_id     |                                                                              |
                  | data[493].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[493].is_smart_asset    | 1                                                                            |
                  | data[493].asset_type_id     | 1                                                                            |

                  | data[494].name              | AssetTest1                                                                   |
                  | data[494].description       | description1                                                                 |
                  | data[494].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[494].is_active         | 1                                                                            |
                  | data[494].is_autoapprove    | 1                                                                            |
                  | data[494].price             | 50000                                                                        |
                  | data[494].qrcodeenable      | 1                                                                            |
                  | data[494].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[494].reasonform_id     |                                                                              |
                  | data[494].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[494].is_smart_asset    | 1                                                                            |
                  | data[494].asset_type_id     | 1                                                                            |

                  | data[495].name              | AssetTest1                                                                   |
                  | data[495].description       | description1                                                                 |
                  | data[495].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[495].is_active         | 1                                                                            |
                  | data[495].is_autoapprove    | 1                                                                            |
                  | data[495].price             | 50000                                                                        |
                  | data[495].qrcodeenable      | 1                                                                            |
                  | data[495].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[495].reasonform_id     |                                                                              |
                  | data[495].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[495].is_smart_asset    | 1                                                                            |
                  | data[495].asset_type_id     | 1                                                                            |

                  | data[496].name              | AssetTest1                                                                   |
                  | data[496].description       | description1                                                                 |
                  | data[496].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[496].is_active         | 1                                                                            |
                  | data[496].is_autoapprove    | 1                                                                            |
                  | data[496].price             | 50000                                                                        |
                  | data[496].qrcodeenable      | 1                                                                            |
                  | data[496].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[496].reasonform_id     |                                                                              |
                  | data[496].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[496].is_smart_asset    | 1                                                                            |
                  | data[496].asset_type_id     | 1                                                                            |

                  | data[497].name              | AssetTest1                                                                   |
                  | data[497].description       | description1                                                                 |
                  | data[497].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[497].is_active         | 1                                                                            |
                  | data[497].is_autoapprove    | 1                                                                            |
                  | data[497].price             | 50000                                                                        |
                  | data[497].qrcodeenable      | 1                                                                            |
                  | data[497].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[497].reasonform_id     |                                                                              |
                  | data[497].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[497].is_smart_asset    | 1                                                                            |
                  | data[497].asset_type_id     | 1                                                                            |

                  | data[498].name              | AssetTest1                                                                   |
                  | data[498].description       | description1                                                                 |
                  | data[498].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[498].is_active         | 1                                                                            |
                  | data[498].is_autoapprove    | 1                                                                            |
                  | data[498].price             | 50000                                                                        |
                  | data[498].qrcodeenable      | 1                                                                            |
                  | data[498].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[498].reasonform_id     |                                                                              |
                  | data[498].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[498].is_smart_asset    | 1                                                                            |
                  | data[498].asset_type_id     | 1                                                                            |
                  | data[499].name              | AssetTest1                                                                   |
                  | data[499].description       | description1                                                                 |
                  | data[499].image             | https://s3-ap-southeast-1.amazonaws.com/bizomtmpfiles                        |
                  | data[499].is_active         | 1                                                                            |
                  | data[499].is_autoapprove    | 1                                                                            |
                  | data[499].price             | 50000                                                                        |
                  | data[499].qrcodeenable      | 1                                                                            |
                  | data[499].auditform_id      | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetaudits%'     |
                  | data[499].reasonform_id     |                                                                              |
                  | data[499].deregisterform_id | DB:activityformfields:id:active=1 AND activity_type LIKE '%assetderegister%' |
                  | data[499].is_smart_asset    | 1                                                                            |
                  | data[499].asset_type_id     | 1                                                                            |
             When I post the request with "insertBulkMdmData_addAssets_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
             Then I should see the response code as "200"
              And the fields in response should match with expected values
                  | JPath    | Value                      |
                  | Result   | true                       |
                  | Reason.1 | Data Uploaded Successfully |
                  | Reason.2 | Data Uploaded Successfully |