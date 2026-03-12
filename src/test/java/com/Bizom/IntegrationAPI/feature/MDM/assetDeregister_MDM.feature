
@Execution @MDM @AssetderegisterMDM
Feature: All testcases of Asset De Register MDM

        @AssetderegisterTest1
        Scenario:AssetderegisterMDM-AssetderegisterTest1 -Verify by passing Mandatory fields -only asset detail id
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_assetDeregisterMdm_MDM" payload
                  | JPath                   | Value                                                  |
                  | data[0].assetdetails_id | DB:assetdetails:id:is_active=1 ORDER BY RAND() LIMIT 1 |
                  | data[1].assetdetails_id | DB:assetdetails:id:is_active=1 ORDER BY RAND() LIMIT 1 |
             When I post the request with "insertMdmData_assetDeregisterMdm_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath    | Value                      |
                  | Result   | true                       |
                  | Reason.1 | Data Uploaded Successfully |
                  | Reason.2 | Data Uploaded Successfully |
              And I verify the data got updated as needed from DB
                  | expectedColumn                                                  | expectedValue |
                  | DB:subcategories:name: id=(SELECT MAX(id)-1 FROM subcategories) | randomString  |
                  | DB:subcategories:name: id=(SELECT MAX(id) FROM subcategories)   | randomString  |

        @AssetderegisterTest2
        Scenario:AssetderegisterMDM-AssetderegisterTest2 -Verify by passing Mandatory fields asset_id ,outlet id and serial number
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_assetDeregisterMdm_MDM" payload
                  | JPath             | Value                                 |
                  | data[0].asset_id  | DB:assetdetails:asset_id:is_active=1  |
                  | data[0].outlet_id | DB:assetdetails:outlet_id:is_active=1 |
                  | data[0].serialno  | DB:assetdetails:serialno:is_active=1  |
             When I post the request with "insertMdmData_assetDeregisterMdm_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath              | Value                                 |
                  | Result             | false                                 |
                  | Reason.2[0].Column | assetdetail_id                        |
                  | Reason.2[0].Error  | There is no data to insert or update. |

        @AssetderegisterTest3
        Scenario:AssetderegisterMDM-AssetderegisterTest3 -Verify by passing both assetdetails_id and   asset_id ,outlet id and serial number
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_assetDeregisterMdm_MDM" payload
                  | JPath                  | Value                                 |
                  | data[0].asset_id       | DB:assetdetails:asset_id:is_active=1  |
                  | data[0].outlet_id      | DB:assetdetails:outlet_id:is_active=1 |
                  | data[0].serialno       | DB:assetdetails:serialno:is_active=1  |
                  | data[0].assetdetail_id | DB:assetdetails:id:is_active=1        |
             When I post the request with "insertMdmData_assetDeregisterMdm_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath              | Value                                                                                    |
                  | Result             | false                                                                                    |
                  | Reason.1[0].Column | assetdetail_id                                                                           |
                  | Reason.1[0].Error  | If you are passing assetdetails_id then you cannot pass outlet_id, serialno or asset_id. |
                  | Reason.2[0].Column | assetdetail_id                                                                           |
                  | Reason.2[0].Error  | There is no data to insert or update.                                                    |
                  
        @AssetderegisterTest4
        Scenario:AssetderegisterMDM-AssetderegisterTest4 -Verify by not passing mandatory fields
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_assetDeregisterMdm_MDM" payload
                  | JPath            | Value                                |
                  | data[0].asset_id | DB:assetdetails:asset_id:is_active=1 |
                  | data[1].asset_id | DB:assetdetails:asset_id:is_active=1 |
             When I post the request with "insertMdmData_assetDeregisterMdm_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath             | Value                                                               |
                  | Result            | false                                                               |
                  | Reason.1[0].Error | outlet_id, assetdetails_id and serialno are mandatory to be passed. |
                  | Reason.2[0].Error | outlet_id, assetdetails_id and serialno are mandatory to be passed. |
        @AssetderegisterTest5
        Scenario:AssetderegisterMDM-AssetderegisterTest5 -Verify by not passing mandatory fields
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_assetDeregisterMdm_MDM" payload
                  | JPath            | Value                                |
                  | data[0].serialno | DB:assetdetails:serialno:is_active=1 |
                  | data[1].serialno | DB:assetdetails:serialno:is_active=1 |
             When I post the request with "insertMdmData_assetDeregisterMdm_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath             | Value                                                               |
                  | Result            | false                                                               |
                  | Reason.1[0].Error | outlet_id, assetdetails_id and serialno are mandatory to be passed. |
                  | Reason.2[0].Error | outlet_id, assetdetails_id and serialno are mandatory to be passed. |
        @AssetderegisterTest6
        Scenario:AssetderegisterMDM-AssetderegisterTest6 -Verify by not passing mandatory fields
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_assetDeregisterMdm_MDM" payload
                  | JPath             | Value                                 |
                  | data[0].outlet_id | DB:assetdetails:outlet_id:is_active=1 |
                  | data[1].outlet_id | DB:assetdetails:outlet_id:is_active=1 |
             When I post the request with "insertMdmData_assetDeregisterMdm_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath             | Value                                                               |
                  | Result            | false                                                               |
                  | Reason.1[0].Error | outlet_id, assetdetails_id and serialno are mandatory to be passed. |
                  | Reason.2[0].Error | outlet_id, assetdetails_id and serialno are mandatory to be passed. |
        @AssetderegisterTest7
        Scenario:AssetderegisterMDM-AssetderegisterTest7 -Verify by passing Mandatory fields -only asset detail id

            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_assetDeregisterMdm_MDM" payload
                  | JPath                   | Value                                                   |
                  | data[0].assetdetails_id | DB:assetdetails:id:is_active=1  ORDER BY RAND() LIMIT 1 |
                  | data[1].assetdetails_id | DB:assetdetails:id:is_active=1  ORDER BY RAND() LIMIT 1 |
             When I post the request with "insertMdmData_assetDeregisterMdm_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath    | Value                      |
                  | Result   | true                       |
                  | Reason.1 | Data Uploaded Successfully |
                  | Reason.2 | Data Uploaded Successfully |
              And I verify the data got updated as needed from DB
                  | expectedColumn                                                    | expectedValue |
                  | DB:assetdetails:is_active:ORDER BY modified DESC LIMIT 1          | 0             |
                  | DB:assetdetails:availabilitystatus:ORDER BY modified DESC LIMIT 1 | Deregistered  |
        @AssetderegisterTest8
        Scenario:AssetderegisterMDM-AssetderegisterTest8 -Verify by passing in active assetdetail_id
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_assetDeregisterMdm_MDM" payload
                  | JPath                   | Value                          |
                  | data[0].assetdetails_id | DB:assetdetails:id:is_active=0 |
                  | data[1].assetdetails_id | DB:assetdetails:id:is_active=0 |
             When I post the request with "insertMdmData_assetDeregisterMdm_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath             | Value                                                                                                         |
                  | Result            | false                                                                                                         |
                  | Reason.1[0].Error | Entered Asset ID does not exist\/inactive or the assetdetail is either inactive or it is already deactivated. |
                  | Reason.2[0].Error | Entered Asset ID does not exist\/inactive or the assetdetail is either inactive or it is already deactivated. |

        @AssetderegisterTest9
        Scenario:AssetderegisterMDM-AssetderegisterTest9 -Verify by passing in valid assetdetail_id
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_assetDeregisterMdm_MDM" payload
                  | JPath                   | Value              |
                  | data[0].assetdetails_id | randomString       |
                  | data[1].assetdetails_id | randomAlphaNumeric |
             When I post the request with "insertMdmData_assetDeregisterMdm_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath  | Value |
                  | Result | false |

        @AssetderegisterTest10
        Scenario:AssetderegisterMDM-AssetderegisterTest10 -Verify by passing in valid assetdetail_id
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_assetDeregisterMdm_MDM" payload
                  | JPath                   | Value                 |
                  | data[0].assetdetails_id | randomAsciiCharacters |
                  | data[1].assetdetails_id | 0                     |
             When I post the request with "insertMdmData_assetDeregisterMdm_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath  | Value |
                  | Result | false |
        @AssetderegisterTest11
        Scenario:AssetderegisterMDM-AssetderegisterTest11 -Verify by passing in valid assetdetail_id
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_assetDeregisterMdm_MDM" payload
                  | JPath                   | Value        |
                  | data[0].assetdetails_id | randomInt    |
                  | data[1].assetdetails_id | randomDouble |
             When I post the request with "insertMdmData_assetDeregisterMdm_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath  | Value |
                  | Result | false |
        @AssetderegisterTest12
        Scenario:AssetderegisterMDM-AssetderegisterTest12 -Verify by passing in valid assetdetail_id
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_assetDeregisterMdm_MDM" payload
                  | JPath                   | Value |
                  | data[0].assetdetails_id | 11.11 |
                  | data[1].assetdetails_id | -100  |
             When I post the request with "insertMdmData_assetDeregisterMdm_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath  | Value |
                  | Result | false |

        @AssetderegisterTest13
        Scenario:AssetderegisterMDM-AssetderegisterTest13 -Verify by passing in active asset_id
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_assetDeregisterMdm_MDM" payload
                  | JPath             | Value                                 |
                  | data[0].asset_id  | DB:assets:id:is_active=0              |
                  | data[0].serialno  | DB:assetdetails:serialno:is_active=1  |
                  | data[0].outlet_id | DB:assetdetails:outlet_id:is_active=1 |
                  | data[1].asset_id  | DB:assets:id:is_active=0              |
                  | data[1].serialno  | DB:assetdetails:serialno:is_active=1  |
                  | data[1].outlet_id | DB:assetdetails:outlet_id:is_active=1 |
             When I post the request with "insertMdmData_assetDeregisterMdm_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath             | Value                                                                                                         |
                  | Result            | false                                                                                                         |
                  | Reason.1[0].Error | Entered Asset ID does not exist\/inactive or the assetdetail is either inactive or it is already deactivated. |
                  | Reason.2[0].Error | Entered Asset ID does not exist\/inactive or the assetdetail is either inactive or it is already deactivated. |
        @AssetderegisterTest14
        Scenario:AssetderegisterMDM-AssetderegisterTest14 -Verify by passing in valid asset_id
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_assetDeregisterMdm_MDM" payload
                  | JPath             | Value                                 |
                  | data[0].asset_id  | randomString                          |
                  | data[0].serialno  | DB:assetdetails:serialno:is_active=1  |
                  | data[0].outlet_id | DB:assetdetails:outlet_id:is_active=1 |
                  | data[1].asset_id  | randomAlphaNumeric                    |
                  | data[1].serialno  | DB:assetdetails:serialno:is_active=1  |
                  | data[1].outlet_id | DB:assetdetails:outlet_id:is_active=1 |
             When I post the request with "insertMdmData_assetDeregisterMdm_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath  | Value |
                  | Result | false |
        @AssetderegisterTest15
        Scenario:AssetderegisterMDM-AssetderegisterTest15 -Verify by passing in valid asset_id
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_assetDeregisterMdm_MDM" payload
                  | JPath             | Value                                 |
                  | data[0].asset_id  | randomAsciiCharacters                 |
                  | data[0].serialno  | DB:assetdetails:serialno:is_active=1  |
                  | data[0].outlet_id | DB:assetdetails:outlet_id:is_active=1 |
                  | data[1].asset_id  | !@#$%^&*(()(*&^%$))                   |
                  | data[1].serialno  | DB:assetdetails:serialno:is_active=1  |
                  | data[1].outlet_id | DB:assetdetails:outlet_id:is_active=1 |
             When I post the request with "insertMdmData_assetDeregisterMdm_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath  | Value |
                  | Result | false |
        @AssetderegisterTest16
        Scenario:AssetderegisterMDM-AssetderegisterTest16 -Verify by passing in valid asset_id
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_assetDeregisterMdm_MDM" payload
                  | JPath             | Value                                 |
                  | data[0].asset_id  | randomInt                             |
                  | data[0].serialno  | DB:assetdetails:serialno:is_active=1  |
                  | data[0].outlet_id | DB:assetdetails:outlet_id:is_active=1 |
                  | data[1].asset_id  | randomDouble                          |
                  | data[1].serialno  | DB:assetdetails:serialno:is_active=1  |
                  | data[1].outlet_id | DB:assetdetails:outlet_id:is_active=1 |
             When I post the request with "insertMdmData_assetDeregisterMdm_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath  | Value |
                  | Result | false |
        @AssetderegisterTest17
        Scenario:AssetderegisterMDM-AssetderegisterTest17 -Verify by passing in valid asset_id
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_assetDeregisterMdm_MDM" payload
                  | JPath             | Value                                 |
                  | data[0].asset_id  | -11                                   |
                  | data[0].serialno  | DB:assetdetails:serialno:is_active=1  |
                  | data[0].outlet_id | DB:assetdetails:outlet_id:is_active=1 |
                  | data[1].asset_id  | 0                                     |
                  | data[1].serialno  | DB:assetdetails:serialno:is_active=1  |
                  | data[1].outlet_id | DB:assetdetails:outlet_id:is_active=1 |
             When I post the request with "insertMdmData_assetDeregisterMdm_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath  | Value |
                  | Result | false |
                    
        @AssetderegisterTest18
        Scenario:AssetderegisterMDM-AssetderegisterTest18 -Verify by passing in active outlet_id
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_assetDeregisterMdm_MDM" payload
                  | JPath             | Value                                |
                  | data[0].asset_id  | DB:assetdetails:asset_id:is_active=1 |
                  | data[0].serialno  | DB:assetdetails:serialno:is_active=1 |
                  | data[0].outlet_id | DB:outlets:id:outletstate_id=2       |
                  | data[1].asset_id  | DB:assetdetails:asset_id:is_active=1 |
                  | data[1].serialno  | DB:assetdetails:serialno:is_active=1 |
                  | data[1].outlet_id | DB:outlets:id:outletstate_id=2       |
             When I post the request with "insertMdmData_assetDeregisterMdm_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath              | Value                                                       |
                  | Result             | false                                                       |
                  | Reason.1[0].Column | outlet_id                                                   |
                  | Reason.1[0].Error  | Entered Outlet ID does not exist or inactive in the system. |
                  | Reason.2[0].Column | outlet_id                                                   |
                  | Reason.2[0].Error  | Entered Outlet ID does not exist or inactive in the system. |
        @AssetderegisterTest19
        Scenario:AssetderegisterMDM-AssetderegisterTest19 -Verify by passing in valid outlet_id
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_assetDeregisterMdm_MDM" payload
                  | JPath             | Value                                |
                  | data[0].asset_id  | DB:assetdetails:asset_id:is_active=1 |
                  | data[0].serialno  | DB:assetdetails:serialno:is_active=1 |
                  | data[0].outlet_id | randomString                         |
                  | data[1].asset_id  | DB:assetdetails:asset_id:is_active=1 |
                  | data[1].serialno  | DB:assetdetails:serialno:is_active=1 |
                  | data[1].outlet_id | randomAlphaNumeric                   |
             When I post the request with "insertMdmData_assetDeregisterMdm_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath              | Value     |
                  | Result             | false     |
                  | Reason.1[0].Column | outlet_id |
                  | Reason.2[0].Column | outlet_id |
        @AssetderegisterTest20
        Scenario:AssetderegisterMDM-AssetderegisterTest20 -Verify by passing in valid outlet_id
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_assetDeregisterMdm_MDM" payload
                  | JPath             | Value                                |
                  | data[0].asset_id  | DB:assetdetails:asset_id:is_active=1 |
                  | data[0].serialno  | DB:assetdetails:serialno:is_active=1 |
                  | data[0].outlet_id | randomAsciiCharacters                |
                  | data[1].asset_id  | DB:assetdetails:asset_id:is_active=1 |
                  | data[1].serialno  | DB:assetdetails:serialno:is_active=1 |
                  | data[1].outlet_id | !@#$%^&*(*&^%$#@#$%                  |
             When I post the request with "insertMdmData_assetDeregisterMdm_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath              | Value     |
                  | Result             | false     |
                  | Reason.1[0].Column | outlet_id |
                  | Reason.2[0].Column | outlet_id |

        @AssetderegisterTest21
        Scenario:AssetderegisterMDM-AssetderegisterTest21 --Verify by passing in valid outlet_id
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_assetDeregisterMdm_MDM" payload
                  | JPath             | Value                                |
                  | data[0].asset_id  | DB:assetdetails:asset_id:is_active=1 |
                  | data[0].serialno  | DB:assetdetails:serialno:is_active=1 |
                  | data[0].outlet_id | randomInt                            |
                  | data[1].asset_id  | DB:assetdetails:asset_id:is_active=1 |
                  | data[1].serialno  | DB:assetdetails:serialno:is_active=1 |
                  | data[1].outlet_id | randomDouble                         |
             When I post the request with "insertMdmData_assetDeregisterMdm_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath              | Value     |
                  | Result             | false     |
                  | Reason.1[0].Column | outlet_id |
                  | Reason.2[0].Column | outlet_id |
        @AssetderegisterTest21
        Scenario:AssetderegisterMDM-AssetderegisterTest21 --Verify by passing in valid outlet_id
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_assetDeregisterMdm_MDM" payload
                  | JPath             | Value                                |
                  | data[0].asset_id  | DB:assetdetails:asset_id:is_active=1 |
                  | data[0].serialno  | DB:assetdetails:serialno:is_active=1 |
                  | data[0].outlet_id | 0                                    |
                  | data[1].asset_id  | DB:assetdetails:asset_id:is_active=1 |
                  | data[1].serialno  | DB:assetdetails:serialno:is_active=1 |
                  | data[1].outlet_id | -1                                   |
             When I post the request with "insertMdmData_assetDeregisterMdm_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath  | Value |
                  | Result | false |
        @AssetderegisterTest23
        Scenario:AssetderegisterMDM-AssetderegisterTest23 --Verify by passing in valid serial number
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_assetDeregisterMdm_MDM" payload
                  | JPath             | Value                                 |
                  | data[0].asset_id  | DB:assetdetails:asset_id:is_active=1  |
                  | data[0].serialno  | randomString                          |
                  | data[0].outlet_id | DB:assetdetails:outlet_id:is_active=1 |
                  | data[1].asset_id  | DB:assetdetails:asset_id:is_active=1  |
                  | data[1].serialno  | randomString                          |
                  | data[1].outlet_id | DB:assetdetails:outlet_id:is_active=1 |
             When I post the request with "insertMdmData_assetDeregisterMdm_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath             | Value                                                       |
                  | Result            | false                                                       |
                  | Reason.1[0].Error | The entered combination of data does not exists for assets. |
                  | Reason.2[0].Error | The entered combination of data does not exists for assets. |
        @AssetderegisterTest24
        Scenario:AssetderegisterMDM-AssetderegisterTest24 --Verify by passing in valid serial number
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_assetDeregisterMdm_MDM" payload
                  | JPath             | Value                                 |
                  | data[0].asset_id  | DB:assetdetails:asset_id:is_active=1  |
                  | data[0].serialno  | randomAlphaNumeric                    |
                  | data[0].outlet_id | DB:assetdetails:outlet_id:is_active=1 |
                  | data[1].asset_id  | DB:assetdetails:asset_id:is_active=1  |
                  | data[1].serialno  | randomAsciiCharacters                 |
                  | data[1].outlet_id | DB:assetdetails:outlet_id:is_active=1 |
             When I post the request with "insertMdmData_assetDeregisterMdm_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath             | Value                                                       |
                  | Result            | false                                                       |
                  | Reason.1[0].Error | The entered combination of data does not exists for assets. |
                  | Reason.2[0].Error | The entered combination of data does not exists for assets. |

        @AssetderegisterTest25
        Scenario:AssetderegisterMDM-AssetderegisterTest25--Verify by passing in valid serial number
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_assetDeregisterMdm_MDM" payload
                  | JPath             | Value                                 |
                  | data[0].asset_id  | DB:assetdetails:asset_id:is_active=1  |
                  | data[0].serialno  | randomInt                             |
                  | data[0].outlet_id | DB:assetdetails:outlet_id:is_active=1 |
                  | data[1].asset_id  | DB:assetdetails:asset_id:is_active=1  |
                  | data[1].serialno  | randomDouble                          |
                  | data[1].outlet_id | DB:assetdetails:outlet_id:is_active=1 |
             When I post the request with "insertMdmData_assetDeregisterMdm_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath             | Value                                                       |
                  | Result            | false                                                       |
                  | Reason.1[0].Error | The entered combination of data does not exists for assets. |
                  | Reason.2[0].Error | The entered combination of data does not exists for assets. |
        @AssetderegisterTest26
        Scenario:AssetderegisterMDM-AssetderegisterTest26--Verify by passing in valid serial number
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_assetDeregisterMdm_MDM" payload
                  | JPath             | Value                                 |
                  | data[0].asset_id  | DB:assetdetails:asset_id:is_active=1  |
                  | data[0].serialno  | -1                                    |
                  | data[0].outlet_id | DB:assetdetails:outlet_id:is_active=1 |
                  | data[1].asset_id  | DB:assetdetails:asset_id:is_active=1  |
                  | data[1].serialno  | 0                                     |
                  | data[1].outlet_id | DB:assetdetails:outlet_id:is_active=1 |
             When I post the request with "insertMdmData_assetDeregisterMdm_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath  | Value |
                  | Result | false |
        @AssetderegisterTest27
        Scenario:AssetderegisterMDM-AssetderegisterTest27--Verify by passing  valid  comment
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_assetDeregisterMdm_MDM" payload
                  | JPath             | Value                                 |
                  | data[0].asset_id  | DB:assetdetails:asset_id:is_active=1  |
                  | data[0].serialno  | DB:assetdetails:serialno:is_active=1  |
                  | data[0].outlet_id | DB:assetdetails:outlet_id:is_active=1 |
                  | data[0].comment   | randomString                          |
                  | data[1].asset_id  | DB:assetdetails:asset_id:is_active=1  |
                  | data[1].serialno  | DB:assetdetails:serialno:is_active=1  |
                  | data[1].outlet_id | DB:assetdetails:outlet_id:is_active=1 |
                  | data[1].comment   | randomAlphaNumeric                    |
             When I post the request with "insertMdmData_assetDeregisterMdm_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath    | Value                      |
                  | Result   | false                      |
                  | Reason.1 | Data Uploaded Successfully |

        @AssetderegisterTest28
        Scenario:AssetderegisterMDM-AssetderegisterTest28--Verify by passing  valid  comment
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_assetDeregisterMdm_MDM" payload
                  | JPath             | Value                                   |
                  | data[0].asset_id  | DB:assetdetails:asset_id:is_active=1    |
                  | data[0].serialno  | DB:assetdetails:serialno:is_active=1    |
                  | data[0].outlet_id | DB:assetdetails:outlet_id:is_active=1   |
                  | data[0].comment   | randomAsciiCharacters                   |
                  | data[1].asset_id  | DB:assetdetails:asset_id:is_active=1    |
                  | data[1].serialno  | DB:assetdetails:serialno:is_active=1    |
                  | data[1].outlet_id | DB:assetdetails:outlet_id:is_active=1   |
                  | data[1].comment   | !@#$5@#$%^&*@#$%^&-#$%^&*()_+_)(*&^%$#) |
             When I post the request with "insertMdmData_assetDeregisterMdm_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath    | Value                      |
                  | Result   | false                      |
                  | Reason.1 | Data Uploaded Successfully |
        @AssetderegisterTest29
        Scenario:AssetderegisterMDM-AssetderegisterTest29--Verify by passing  valid  comment- Boundary value -200 characters
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_assetDeregisterMdm_MDM" payload
                  | JPath             | Value                                   |
                  | data[0].asset_id  | DB:assetdetails:asset_id:is_active=1    |
                  | data[0].serialno  | DB:assetdetails:serialno:is_active=1    |
                  | data[0].outlet_id | DB:assetdetails:outlet_id:is_active=1   |
                  | data[0].comment   | ransomString:200                        |
                  | data[1].asset_id  | DB:assetdetails:asset_id:is_active=1    |
                  | data[1].serialno  | DB:assetdetails:serialno:is_active=1    |
                  | data[1].outlet_id | DB:assetdetails:outlet_id:is_active=1   |
                  | data[1].comment   | !@#$5@#$%^&*@#$%^&-#$%^&*()_+_)(*&^%$#) |
             When I post the request with "insertMdmData_assetDeregisterMdm_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath  | Value |
                  | Result | false |
        @AssetderegisterTest30
        Scenario:AssetderegisterMDM-AssetderegisterTest30--Verify by passing  valid  comment- Boundary value -201 characters
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_assetDeregisterMdm_MDM" payload
                  | JPath             | Value                                 |
                  | data[0].asset_id  | DB:assetdetails:asset_id:is_active=1  |
                  | data[0].serialno  | DB:assetdetails:serialno:is_active=1  |
                  | data[0].outlet_id | DB:assetdetails:outlet_id:is_active=1 |
                  | data[0].comment   | randomString:201                      |
                  | data[1].asset_id  | DB:assetdetails:asset_id:is_active=1  |
                  | data[1].serialno  | DB:assetdetails:serialno:is_active=1  |
                  | data[1].outlet_id | DB:assetdetails:outlet_id:is_active=1 |
                  | data[1].comment   | randomString:201                      |
             When I post the request with "insertMdmData_assetDeregisterMdm_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath  | Value |
                  | Result | false |
        @AssetderegisterTest31
        Scenario:AssetderegisterMDM-AssetderegisterTest31--Combination of asset id,serial number and outlet_id is in active
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_assetDeregisterMdm_MDM" payload
                  | JPath             | Value                                 |
                  | data[0].asset_id  | DB:assetdetails:asset_id:is_active=0  |
                  | data[0].serialno  | DB:assetdetails:serialno:is_active=0  |
                  | data[0].outlet_id | DB:assetdetails:outlet_id:is_active=0 |
                  | data[1].asset_id  | DB:assetdetails:asset_id:is_active=0  |
                  | data[1].serialno  | DB:assetdetails:serialno:is_active=0  |
                  | data[1].outlet_id | DB:assetdetails:outlet_id:is_active=0 |
             When I post the request with "insertMdmData_assetDeregisterMdm_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath             | Value                                                       |
                  | Result            | false                                                       |
                  | Reason.1[0].Error | The entered combination of data does not exists for assets. |
                  | Reason.2[0].Error | The entered combination of data does not exists for assets. |
        @AssetderegisterTest32
        Scenario:AssetderegisterMDM-AssetderegisterTest32--Verify by passing invalid asset_id
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_assetDeregisterMdm_MDM" payload
                  | JPath             | Value                                 |
                  | data[0].asset_id  | invalidAssetId                        |
                  | data[0].serialno  | DB:assetdetails:serialno:is_active=1  |
                  | data[0].outlet_id | DB:assetdetails:outlet_id:is_active=1 |
                  | data[1].asset_id  | invalidAssetId                        |
                  | data[1].serialno  | DB:assetdetails:serialno:is_active=1  |
                  | data[1].outlet_id | DB:assetdetails:outlet_id:is_active=1 |
             When I post the request with "insertMdmData_assetDeregisterMdm_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath  | Value |
                  | Result | false |

        @AssetderegisterTest33
        Scenario:AssetderegisterMDM-AssetderegisterTest33--Verify by passing empty serial number
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_assetDeregisterMdm_MDM" payload
                  | JPath             | Value                                 |
                  | data[0].asset_id  | DB:assetdetails:asset_id:is_active=1  |
                  | data[0].serialno  |                                       |
                  | data[0].outlet_id | DB:assetdetails:outlet_id:is_active=1 |
                  | data[1].asset_id  | DB:assetdetails:asset_id:is_active=1  |
                  | data[1].serialno  |                                       |
                  | data[1].outlet_id | DB:assetdetails:outlet_id:is_active=1 |
             When I post the request with "insertMdmData_assetDeregisterMdm_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath  | Value |
                  | Result | false |

        @AssetderegisterTest34
        Scenario:AssetderegisterMDM-AssetderegisterTest34--Verify by passing duplicate asset_id in the same request
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_assetDeregisterMdm_MDM" payload
                  | JPath             | Value                                 |
                  | data[0].asset_id  | DB:assetdetails:asset_id:is_active=1  |
                  | data[0].serialno  | DB:assetdetails:serialno:is_active=1  |
                  | data[0].outlet_id | DB:assetdetails:outlet_id:is_active=1 |
                  | data[1].asset_id  | DB:assetdetails:asset_id:is_active=1  |
                  | data[1].serialno  | DB:assetdetails:serialno:is_active=1  |
                  | data[1].outlet_id | DB:assetdetails:outlet_id:is_active=1 |
             When I post the request with "insertMdmData_assetDeregisterMdm_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath  | Value |
                  | Result | false |

        @AssetderegisterTest35
        Scenario:AssetderegisterMDM-AssetderegisterTest34--Verify by passing empty json
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |

             When I post the request with "insertMdmData_assetDeregisterMdm_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath  | Value |
                  | Result | false |


































