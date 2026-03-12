@AreaMDM @MDM @Execution

Feature: All testcases of Area MDM

  # -------------------------------------------------------------------------
  # Mandatory fields tests (name, warehouse_id)
  # -------------------------------------------------------------------------

        @AreaTest2
        Scenario: AreaMDM:AreaTest2 - Mandatory fields - both name and warehouse_id provided (positive)
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_area_MDM" payload
                  | JPath                | Value                       |
                  | data[0].name         | randomString                |
                  | data[0].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[1].name         | randomString                |
                  | data[1].warehouse_id | DB:warehouses:id:isactive=1 |
             When I post the request with "insertMdmData_area_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath    | Value                      |
                  | Result   | true                       |
                  | Reason.1 | Data Uploaded Successfully |
                  | Reason.2 | Data Uploaded Successfully |
              And verify response time is less than "3000" milliseconds

        @AreaTest3
        Scenario: AreaMDM:AreaTest3 - Mandatory field missing - passing only name  (negative)
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_area_MDM" payload
                  | JPath                | Value                       |
                  | data[0].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[1].warehouse_id | DB:warehouses:id:isactive=1 |
             When I post the request with "insertMdmData_area_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath             | Value                                                 |
                  | Result            | false                                                 |
                  | Reason.1[0].Error | Area name is mandatory, please provide the Area name. |
                  | Reason.2[0].Error | Area name is mandatory, please provide the Area name. |
              And verify response time is less than "3000" milliseconds

        @AreaTest4
        Scenario: AreaMDM:AreaTest4 - Mandatory field missing - warehouse_id omitted (negative)
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_area_MDM" payload
                  | JPath        | Value        |
                  | data[0].name | randomString |
                  | data[1].name | randomString |
             When I post the request with "insertMdmData_area_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath             | Value                                                       |
                  | Result            | false                                                       |
                  | Reason.1[0].Error | Warehouse ID is mandatory, please provide the warehouse ID. |
                  | Reason.2[0].Error | Warehouse ID is mandatory, please provide the warehouse ID. |
              And verify response time is less than "3000" milliseconds

  # -------------------------------------------------------------------------
  # Field-by-field tests (one by one) - NAME
  # -------------------------------------------------------------------------

        @AreaTest5
        Scenario: AreaMDM:AreaTest5 - Name - boundary positive (255 chars) (positive)
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_area_MDM" payload
                  | JPath                | Value                       |
                  | data[0].name         | randomString:255            |
                  | data[0].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[1].name         | randomString:255            |
                  | data[1].warehouse_id | DB:warehouses:id:isactive=1 |
             When I post the request with "insertMdmData_area_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath    | Value                      |
                  | Result   | true                       |
                  | Reason.1 | Data Uploaded Successfully |
                  | Reason.2 | Data Uploaded Successfully |
              And verify response time is less than "3000" milliseconds

        @AreaTest6
        Scenario: AreaMDM:AreaTest6 - Name - boundary negative (256 chars) (negative)
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_area_MDM" payload
                  | JPath                | Value                                                                                                                                                                                                                                                            |
                  | data[0].name         | pGnLWrmiiFjiRrrTMITtpawOOPYnkNXqjIgUhNCvqwVNCcCDfAPQJDYaHZjFdLHMuMOjPdDhflJZephUzamuDHRtpcdUTIEDYIcsArQFQMAlWDYBEIVPlwKeeNvjzwrCXTurjQIlaFfflDOcTlcooMJwVBqcJtXInNzVITHupViBrjKNMnxdVIguzWceFMFAycSjzaQDTnpJxoZIwPjWcmPLtTVeOqUTxzKaVChBVSjjqJSEzbOHkNDxhqfpiDx1 |
                  | data[0].warehouse_id | DB:warehouses:id:isactive=1                                                                                                                                                                                                                                      |
                  | data[1].name         | pGnLWrmiiFjiRrrTMITtpawOOPYnkNXqjIgUhNCvqwVNCcCDfAPQJDYaHZjFdLHMuMOjPdDhflJZephUzamuDHRtpcdUTIEDYIcsArQFQMAlWDYBEIVPlwKeeNvjzwrCXTurjQIlaFfflDOcTlcooMJwVBqcJtXInNzVITHupViBrjKNMnxdVIguzWceFMFAycSjzaQDTnpJxoZIwPjWcmPLtTVeOqUTxzKaVChBVSjjqJSEzbOHkNDxhqfpiDx2 |
                  | data[1].warehouse_id | DB:warehouses:id:isactive=1                                                                                                                                                                                                                                      |
             When I post the request with "insertMdmData_area_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath             | Value                                                                                                                                                                                                                                                                                                       |
                  | Result            | false                                                                                                                                                                                                                                                                                                       |
                  | Reason.1[0].Error | The value pGnLWrmiiFjiRrrTMITtpawOOPYnkNXqjIgUhNCvqwVNCcCDfAPQJDYaHZjFdLHMuMOjPdDhflJZephUzamuDHRtpcdUTIEDYIcsArQFQMAlWDYBEIVPlwKeeNvjzwrCXTurjQIlaFfflDOcTlcooMJwVBqcJtXInNzVITHupViBrjKNMnxdVIguzWceFMFAycSjzaQDTnpJxoZIwPjWcmPLtTVeOqUTxzKaVChBVSjjqJSEzbOHkNDxhqfpiDx1 should have maximum 255 letters. |
                  | Reason.2[0].Error | The value pGnLWrmiiFjiRrrTMITtpawOOPYnkNXqjIgUhNCvqwVNCcCDfAPQJDYaHZjFdLHMuMOjPdDhflJZephUzamuDHRtpcdUTIEDYIcsArQFQMAlWDYBEIVPlwKeeNvjzwrCXTurjQIlaFfflDOcTlcooMJwVBqcJtXInNzVITHupViBrjKNMnxdVIguzWceFMFAycSjzaQDTnpJxoZIwPjWcmPLtTVeOqUTxzKaVChBVSjjqJSEzbOHkNDxhqfpiDx2 should have maximum 255 letters. |
              And verify response time is less than "3000" milliseconds

        @AreaTest7
        Scenario: AreaMDM:AreaTest7 - Name - special characters and alphanumeric (positive)
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_area_MDM" payload
                  | JPath                | Value                       |
                  | data[0].name         | randomAlphanumeric          |
                  | data[0].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[1].name         | randomAsciiCharacters       |
                  | data[1].warehouse_id | DB:warehouses:id:isactive=1 |
             When I post the request with "insertMdmData_area_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath    | Value                      |
                  | Result   | true                       |
                  | Reason.1 | Data Uploaded Successfully |
                  | Reason.2 | Data Uploaded Successfully |
              And verify response time is less than "3000" milliseconds

  # -------------------------------------------------------------------------
  # Field: ERP ID (erpid)
  # -------------------------------------------------------------------------

        @AreaTest8
        Scenario: AreaMDM:AreaTest8 - ErpID - length positive (<=30) (positive)
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_area_MDM" payload
                  | JPath                | Value                       |
                  | data[0].name         | randomString                |
                  | data[0].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[0].erpid        | randomString:30             |
                  | data[1].name         | randomString                |
                  | data[1].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[1].erpid        | randomString:29             |
             When I post the request with "insertMdmData_area_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath    | Value                      |
                  | Result   | true                       |
                  | Reason.1 | Data Uploaded Successfully |
                  | Reason.2 | Data Uploaded Successfully |
              And verify response time is less than "3000" milliseconds

        @AreaTest9 @BugFix
        Scenario: AreaMDM:AreaTest9 - ErpID - length negative (>30) (negative)
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_area_MDM" payload
                  | JPath                | Value                       |
                  | data[0].name         | randomString                |
                  | data[0].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[0].erpid        | randomString:31             |
                  | data[1].name         | randomString                |
                  | data[1].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[1].erpid        | randomString:31             |
             When I post the request with "insertMdmData_area_MDM" payload with dynamic access token and query parameters
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

        @AreaTest10
        Scenario: AreaMDM:AreaTest10 - ErpID - duplicate within same sheet (negative)
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_area_MDM" payload
                  | JPath                | Value                       |
                  | data[0].name         | randomString                |
                  | data[0].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[0].erpid        | randomAlphanumeric          |
                  | data[1].name         | randomString                |
                  | data[1].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[1].erpid        | randomAlphanumeric          |
             When I post the request with "insertMdmData_area_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath    | Value                      |
                  | Result   | true                       |
                  | Reason.1 | Data Uploaded Successfully |
                  | Reason.2 | Data Uploaded Successfully |
              And verify response time is less than "3000" milliseconds

        @AreaTest11
        Scenario: AreaMDM:AreaTest11 - ErpID - duplicate with DB existing erpid (negative)
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_area_MDM" payload
                  | JPath                | Value                                          |
                  | data[0].name         | randomString                                   |
                  | data[0].warehouse_id | DB:warehouses:id:isactive=1                    |
                  | data[0].erpid        | DB:areas:erpid:erpid!='' AND erpid IS NOT NULL |
                  | data[1].name         | randomString                                   |
                  | data[1].warehouse_id | DB:warehouses:id:isactive=1                    |
                  | data[1].erpid        | DB:areas:erpid:erpid!='' AND erpid IS NOT NULL |
             When I post the request with "insertMdmData_area_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath             | Value                                |
                  | Result            | false                                |
                  | Reason.1[0].Error | "erpid is already exist in the DB. " |
                  | Reason.2[0].Error | "erpid is already exist in the DB. " |
              And verify response time is less than "3000" milliseconds

  # -------------------------------------------------------------------------
  # Field: PIN
  # -------------------------------------------------------------------------

        @AreaTest12
        Scenario: AreaMDM:AreaTest12 - Pin - single pin positive
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_area_MDM" payload
                  | JPath                | Value                       |
                  | data[0].name         | randomString                |
                  | data[0].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[0].pin          | 560001                      |
                  | data[1].name         | randomString                |
                  | data[1].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[1].pin          | 560002                      |
             When I post the request with "insertMdmData_area_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath    | Value                      |
                  | Result   | true                       |
                  | Reason.1 | Data Uploaded Successfully |
                  | Reason.2 | Data Uploaded Successfully |
              And verify response time is less than "3000" milliseconds

        @AreaTest13
        Scenario: AreaMDM:AreaTest13 - Pin - multiple comma separated pins positive
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_area_MDM" payload
                  | JPath                | Value                       |
                  | data[0].name         | randomString                |
                  | data[0].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[0].pin          | 560001,560002               |
                  | data[1].name         | randomString                |
                  | data[1].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[1].pin          | 560003,560004               |
             When I post the request with "insertMdmData_area_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath    | Value                      |
                  | Result   | true                       |
                  | Reason.1 | Data Uploaded Successfully |
                  | Reason.2 | Data Uploaded Successfully |
              And verify response time is less than "3000" milliseconds

        @AreaTest14
        Scenario: AreaMDM:AreaTest14 - Pin - invalid format (negative)-Should work as per UI
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_area_MDM" payload
                  | JPath                | Value                       |
                  | data[0].name         | randomString                |
                  | data[0].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[0].pin          | abcdef                      |
                  | data[1].name         | randomString                |
                  | data[1].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[1].pin          | 56abc                       |
             When I post the request with "insertMdmData_area_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath  | Value |
                  | Result | true  |
              And verify response time is less than "3000" milliseconds

  # -------------------------------------------------------------------------
  # Field: category_id
  # -------------------------------------------------------------------------

        @AreaTest15
        Scenario: AreaMDM:AreaTest15 - Category_id - numeric & active (positive)
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_area_MDM" payload
                  | JPath                | Value                          |
                  | data[0].name         | randomString                   |
                  | data[0].warehouse_id | DB:warehouses:id:isactive=1    |
                  | data[0].category_id  | DB:area_categories:id:active=1 |
                  | data[1].name         | randomString                   |
                  | data[1].warehouse_id | DB:area_categories:id:active=1 |
                  | data[1].category_id  | 1                              |
             When I post the request with "insertMdmData_area_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath    | Value                      |
                  | Result   | true                       |
                  | Reason.1 | Data Uploaded Successfully |
                  | Reason.2 | Data Uploaded Successfully |
              And verify response time is less than "3000" milliseconds

        @AreaTest16
        Scenario: AreaMDM:AreaTest16 - Category_id - non-numeric or active and inactive (negative)
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_area_MDM" payload
                  | JPath                | Value                          |
                  | data[0].name         | randomString                   |
                  | data[0].warehouse_id | DB:warehouses:id:isactive=1    |
                  | data[0].category_id  | DB:area_categories:id:active=1 |
                  | data[1].name         | randomString                   |
                  | data[1].warehouse_id | DB:warehouses:id:isactive=1    |
                  | data[1].category_id  | DB:area_categories:id:active=0 |
             When I post the request with "insertMdmData_area_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath             | Value                                       |
                  | Result            | false                                       |
                  | Reason.1          | "Data Uploaded Successfully"                |
                  | Reason.2[0].Error | "Category id does not exists or In active." |
              And verify response time is less than "3000" milliseconds

  # -------------------------------------------------------------------------
  # Field: balance (depends on enableAreaBalance)
  # -------------------------------------------------------------------------
        @AreaTest17
        Scenario: AreaMDM:AreaTest17 - Balance - negative when area balance enabled (negative) enableAreaBalance=1
            Given I set up base URI for transactions
            Given I update the following columns in "settings" table where "name='enableAreaBalance'"
                  | column | value |
                  | value  | 1     |
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_area_MDM" payload
                  | JPath                | Value                       |
                  | data[0].name         | randomString                |
                  | data[0].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[0].balance      | -10.0                       |
                  | data[1].name         | randomString                |
                  | data[1].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[1].balance      | -20.0                       |
             When I post the request with "insertMdmData_area_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath             | Value                                                          |
                  | Result            | false                                                          |
                  | Reason.1[0].Error | Balance should contain a valid non-negative number or decimal. |
                  | Reason.2[0].Error | Balance should contain a valid non-negative number or decimal. |
              And verify response time is less than "3000" milliseconds


        @AreaTest18
        Scenario: AreaMDM:AreaTest18 - Balance - non-negative decimal allowed (positive) enableAreaBalance=1
            Given I update the following columns in "settings" table where "name='enableAreaBalance'"
                  | column | value |
                  | value  | 1     |
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_area_MDM" payload
                  | JPath                | Value                       |
                  | data[0].name         | randomString                |
                  | data[0].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[0].balance      | 0                           |
                  | data[1].name         | randomString                |
                  | data[1].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[1].balance      | 100.75                      |
             When I post the request with "insertMdmData_area_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath    | Value                      |
                  | Result   | true                       |
                  | Reason.1 | Data Uploaded Successfully |
                  | Reason.2 | Data Uploaded Successfully |
              And verify response time is less than "3000" milliseconds

        @AreaTest19
        Scenario: AreaMDM:AreaTest19 - Balance - non-negative decimal allowed enableAreaBalance=0(positive)
            Given I update the following columns in "settings" table where "name='enableAreaBalance'"
                  | column | value |
                  | value  | 0     |
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_area_MDM" payload
                  | JPath                | Value                       |
                  | data[0].name         | randomString                |
                  | data[0].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[0].balance      | -10.0                       |
                  | data[1].name         | randomString                |
                  | data[1].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[1].balance      | -100.75                     |
             When I post the request with "insertMdmData_area_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath    | Value                      |
                  | Result   | true                       |
                  | Reason.1 | Data Uploaded Successfully |
                  | Reason.2 | Data Uploaded Successfully |
              And verify response time is less than "3000" milliseconds

  # -------------------------------------------------------------------------
  # Field: collectionseqno & billsequenceno (depends on enableBillNoGenerationAreaWise)
  # -------------------------------------------------------------------------

        @AreaTest20
        Scenario: AreaMDM:AreaTest20 - collectionseqno & billsequenceno - invalid when decimals or negative and generation enabled (negative)
            Given I set up base URI for transactions
            Given I update the following columns in "settings" table where "name='enableBillNoGenerationAreaWise'"
                  | column | value |
                  | value  | 1     |
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_area_MDM" payload
                  | JPath                   | Value                       |
                  | data[0].name            | randomString                |
                  | data[0].warehouse_id    | DB:warehouses:id:isactive=1 |
                  | data[0].collectionseqno | -1.5                        |
                  | data[0].billsequenceno  | -10                         |
                  | data[1].name            | randomString                |
                  | data[1].warehouse_id    | DB:warehouses:id:isactive=1 |
                  | data[1].collectionseqno | 1.5                         |
                  | data[1].billsequenceno  | -1.5                        |
             When I post the request with "insertMdmData_area_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath             | Value                                                      |
                  | Result            | false                                                      |
                  | Reason.1[0].Error | "billsequence no should be positive non-decimal number"    |
                  | Reason.1[1].Error | "collectionseqno no should be positive non-decimal number" |
                  | Reason.2[0].Error | "billsequence no should be positive non-decimal number"    |
                  | Reason.2[1].Error | "collectionseqno no should be positive non-decimal number" |
              And verify response time is less than "3000" milliseconds

        @AreaTest21
        Scenario: AreaMDM:AreaTest21 - collectionseqno & billsequenceno - invalid when decimals or negative and generation enabled (negative)
            Given I set up base URI for transactions
            Given I update the following columns in "settings" table where "name='enableBillNoGenerationAreaWise'"
                  | column | value |
                  | value  | 1     |
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_area_MDM" payload
                  | JPath                   | Value                       |
                  | data[0].name            | randomString                |
                  | data[0].warehouse_id    | DB:warehouses:id:isactive=1 |
                  | data[0].collectionseqno | 999999999999999             |
                  | data[0].billsequenceno  | 999999999999999             |
                  | data[1].name            | randomString                |
                  | data[1].warehouse_id    | DB:warehouses:id:isactive=1 |
                  | data[1].collectionseqno | 999999999999999             |
                  | data[1].billsequenceno  | 999999999999999             |
             When I post the request with "insertMdmData_area_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath    | Value                      |
                  | Result   | true                       |
                  | Reason.1 | Data Uploaded Successfully |
                  | Reason.2 | Data Uploaded Successfully |

              And verify response time is less than "3000" milliseconds

        @AreaTest22
        Scenario: AreaMDM:AreaTest22 - collectionseqno & billsequenceno - invalid when decimals or negative and enableBillNoGenerationAreaWise=0
            Given I set up base URI for transactions
            Given I update the following columns in "settings" table where "name='enableBillNoGenerationAreaWise'"
                  | column | value |
                  | value  | 0     |
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_area_MDM" payload
                  | JPath                   | Value                       |
                  | data[0].name            | randomString                |
                  | data[0].warehouse_id    | DB:warehouses:id:isactive=1 |
                  | data[0].collectionseqno | -1.5                        |
                  | data[0].billsequenceno  | -10                         |
                  | data[1].name            | randomString                |
                  | data[1].warehouse_id    | DB:warehouses:id:isactive=1 |
                  | data[1].collectionseqno | 1.5                         |
                  | data[1].billsequenceno  | -1.5                        |
             When I post the request with "insertMdmData_area_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath    | Value                      |
                  | Result   | true                       |
                  | Reason.1 | Data Uploaded Successfully |
                  | Reason.2 | Data Uploaded Successfully |
              And verify response time is less than "3000" milliseconds

        @AreaTest23
        Scenario: AreaMDM:AreaTest23 - collectionseqno & billsequenceno - invalid when decimals or negative enableBillNoGenerationAreaWise=0
            Given I set up base URI for transactions
            Given I update the following columns in "settings" table where "name='enableBillNoGenerationAreaWise'"
                  | column | value |
                  | value  | 0     |
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_area_MDM" payload
                  | JPath                   | Value                       |
                  | data[0].name            | randomString                |
                  | data[0].warehouse_id    | DB:warehouses:id:isactive=1 |
                  | data[0].collectionseqno | 999999999999999             |
                  | data[0].billsequenceno  | 999999999999999             |
                  | data[1].name            | randomString                |
                  | data[1].warehouse_id    | DB:warehouses:id:isactive=1 |
                  | data[1].collectionseqno | 999999999999999             |
                  | data[1].billsequenceno  | 999999999999999             |
             When I post the request with "insertMdmData_area_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath    | Value                      |
                  | Result   | true                       |
                  | Reason.1 | Data Uploaded Successfully |
                  | Reason.2 | Data Uploaded Successfully |
              And verify response time is less than "3000" milliseconds
  # -------------------------------------------------------------------------
  # Field: is_active
  # -------------------------------------------------------------------------

        @ArearTest24
        Scenario: AreaMDM:ArearTest24 - is_active - accept 0 and 1 (positive)
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_area_MDM" payload
                  | JPath                | Value                       |
                  | data[0].name         | randomString                |
                  | data[0].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[0].is_active    | 1                           |
                  | data[1].name         | randomString                |
                  | data[1].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[1].is_active    | 0                           |
             When I post the request with "insertMdmData_area_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath    | Value                      |
                  | Result   | true                       |
                  | Reason.1 | Data Uploaded Successfully |
                  | Reason.2 | Data Uploaded Successfully |
              And verify response time is less than "3000" milliseconds


        @AreaTest25
        Scenario: AreaMDM:AreaTest25 - is_active - invalid values (negative)
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_area_MDM" payload
                  | JPath                | Value                       |
                  | data[0].name         | randomString                |
                  | data[0].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[0].is_active    | 2                           |
                  | data[1].name         | randomString                |
                  | data[1].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[1].is_active    | alphabets                   |
             When I post the request with "insertMdmData_area_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath             | Value                      |
                  | Result            | false                      |
                  | Reason.1[0].Error | "Only 1 or 0 is accepted." |
                  | Reason.2[0].Error | "Only 1 or 0 is accepted." |
              And verify response time is less than "3000" milliseconds

        @AreaTest26
        Scenario: AreaMDM:AreaTest26 - duplicate area name exist in DB
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_area_MDM" payload
                  | JPath                | Value                       |
                  | data[0].name         | DB:areas:name:is_active=1   |
                  | data[0].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[0].is_active    | 1                           |
                  | data[1].name         | DB:areas:name:is_active=1   |
                  | data[1].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[1].is_active    | 1                           |
             When I post the request with "insertMdmData_area_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath  | Value |
                  | Result | false |
              And verify response time is less than "3000" milliseconds

        @AreaTest27
        Scenario: AreaMDM:AreaTest27 - Valid and active warehouse name(Only)
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_area_MDM" payload
                  | JPath                  | Value                         |
                  | data[0].name           | randomString                  |
                  | data[0].warehouse_name | DB:warehouses:name:isactive=1 |
                  | data[0].is_active      | 1                             |
                  | data[1].name           | randomString                  |
                  | data[1].warehouse_name | DB:warehouses:name:isactive=1 |
                  | data[1].is_active      | 1                             |
             When I post the request with "insertMdmData_area_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath    | Value                      |
                  | Result   | true                       |
                  | Reason.1 | Data Uploaded Successfully |
                  | Reason.2 | Data Uploaded Successfully |
              And verify response time is less than "3000" milliseconds

        @AreaTest28
        Scenario: AreaMDM:AreaTest28 - Valid and active warehouse name mapped to valid warehouse id(Only)
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_area_MDM" payload
                  | JPath                  | Value                         |
                  | data[0].name           | randomString                  |
                  | data[0].warehouse_id   | DB:warehouses:id:isactive=1   |
                  | data[0].warehouse_name | DB:warehouses:name:isactive=1 |
                  | data[0].is_active      | 1                             |
                  | data[1].name           | randomString                  |
                  | data[1].warehouse_id   | DB:warehouses:id:isactive=1   |
                  | data[1].warehouse_name | DB:warehouses:name:isactive=1 |
                  | data[1].is_active      | 1                             |
             When I post the request with "insertMdmData_area_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath    | Value                      |
                  | Result   | true                       |
                  | Reason.1 | Data Uploaded Successfully |
                  | Reason.2 | Data Uploaded Successfully |
              And verify response time is less than "3000" milliseconds

        @AreaTest29
        Scenario: AreaMDM:AreaTest29 - Valid and active warehouse name which is not  mapped to valid warehouse id
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_area_MDM" payload
                  | JPath                  | Value                         |
                  | data[0].name           | randomString                  |
                  | data[0].warehouse_id   | DB:warehouses:id:isactive=1   |
                  | data[0].warehouse_name | DB:warehouses:name:isactive=0 |
                  | data[0].is_active      | 1                             |
                  | data[1].name           | randomString                  |
                  | data[1].warehouse_id   | DB:warehouses:id:isactive=1   |
                  | data[1].warehouse_name | DB:warehouses:name:isactive=0 |
                  | data[1].is_active      | 1                             |
             When I post the request with "insertMdmData_area_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath             | Value                                     |
                  | Result            | false                                     |
                  | Reason.1[0].Error | 'warehouse_id' and 'name' does not match. |
                  | Reason.2[0].Error | 'warehouse_id' and 'name' does not match. |
              And verify response time is less than "3000" milliseconds

        @AreaTest30
        Scenario: AreaMDM:AreaTest30 - InValid and Inactive warehouse
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_area_MDM" payload
                  | JPath                  | Value                         |
                  | data[0].name           | randomString                  |
                  | data[0].Warehouse_name | DB:warehouses:name:isactive=0 |
                  | data[0].is_active      | 1                             |
                  | data[1].name           | randomString                  |
                  | data[1].Warehouse_name | randomString                  |
                  | data[1].is_active      | 1                             |
             When I post the request with "insertMdmData_area_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath  | Value |
                  | Result | false |
              And verify response time is less than "3000" milliseconds

        @AreaTest31
        Scenario: AreaMDM:AreaTest31 - collectionseqno & billsequenceno - invalid
            Given I set up base URI for transactions
            Given I update the following columns in "settings" table where "name='enableBillNoGenerationAreaWise'"
                  | column | value |
                  | value  | 0     |
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_area_MDM" payload
                  | JPath                   | Value                       |
                  | data[0].name            | randomString                |
                  | data[0].warehouse_id    | DB:warehouses:id:isactive=1 |
                  | data[0].collectionseqno | randomString                |
                  | data[0].billsequenceno  | randomAlphaNumeric          |
                  | data[1].name            | randomString                |
                  | data[1].warehouse_id    | DB:warehouses:id:isactive=1 |
                  | data[1].collectionseqno | randomAsciiCharacters       |
                  | data[1].billsequenceno  | 0                           |
             When I post the request with "insertMdmData_area_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath  | Value |
                  | Result | false |
              And verify response time is less than "3000" milliseconds

        @AreaTest32
        Scenario: AreaMDM:AreaTest32 - Data verification by passing all the field values
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_area_MDM" payload
                  | JPath                   | Value                       |
                  | data[0].name            | randomString                |
                  | data[0].warehouse_id    | DB:warehouses:id:isactive=1 |
                  | data[0].is_active       | 1                           |
                  | data[0].erpid           | randomString                |
                  | data[0].pin             | 555555                      |
                  | data[0].balance         | 666666                      |
                  | data[0].collectionseqno | 777777                      |
                  | data[0].billsequenceno  | 888888                      |
                  | data[1].name            | randomString                |
                  | data[1].warehouse_id    | DB:warehouses:id:isactive=1 |
                  | data[1].is_active       | 1                           |
                  | data[1].erpid           | randomString                |
                  | data[1].pin             | 555555                      |
                  | data[1].balance         | 666666                      |
                  | data[1].collectionseqno | 777777                      |
                  | data[1].billsequenceno  | 888888                      |
             When I post the request with "insertMdmData_area_MDM" payload with dynamic access token and query parameters
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
                  | expectedColumn                                 | expectedValue |
                  | DB:areas:name: id=(SELECT MAX(id) FROM areas)  | randomString  |
                  | DB:areas:erpid: id=(SELECT MAX(id) FROM areas) | randomString  |
#      | DB:areas:balance: id=(SELECT MAX(id) FROM areas)         | randomInt     |
                  | DB:areas:collectionseqno: id=(SELECT MAX(id) FROM areas)                     | 777777 |
                  | DB:areas:billsequenceno: id=(SELECT MAX(id) FROM areas)                      | 888888 |
                  | DB:areapincodemappings:pincode: id=(SELECT MAX(id) FROM areapincodemappings) | 555555 |
                  | DB:areas:is_active: id=(SELECT MAX(id) FROM areas)                           | true   |

        @AreaTest33
        Scenario: AreaMDM:AreaTest33 - Data verification by passing invalid data into field values for bulk upload
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertBulkMdmData_area_MDM" payload
                  | JPath                  | Value                       |
                  | data[0].name           | randomString                |
                  | data[0].warehouse_id   | DB:warehouses:id:isactive=1 |
                  | data[1].name           | randomString                |
                  | data[1].warehouse_id   | DB:warehouses:id:isactive=1 |
                  | data[2].name           | randomString                |
                  | data[2].warehouse_id   | DB:warehouses:id:isactive=1 |
                  | data[3].name           | randomString                |
                  | data[3].warehouse_id   | DB:warehouses:id:isactive=1 |
                  | data[4].name           | randomString                |
                  | data[4].warehouse_id   | DB:warehouses:id:isactive=1 |
                  | data[5].name           | randomString                |
                  | data[5].warehouse_id   | DB:warehouses:id:isactive=1 |
                  | data[6].name           | randomString                |
                  | data[6].warehouse_id   | DB:warehouses:id:isactive=1 |
                  | data[7].name           | randomString                |
                  | data[7].warehouse_id   | DB:warehouses:id:isactive=1 |
                  | data[8].name           | randomString                |
                  | data[8].warehouse_id   | DB:warehouses:id:isactive=1 |
                  | data[9].name           | randomString                |
                  | data[9].warehouse_id   | DB:warehouses:id:isactive=1 |
                  | data[10].name          | randomString                |
                  | data[10].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[11].name          | randomString                |
                  | data[11].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[12].name          | randomString                |
                  | data[12].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[13].name          | randomString                |
                  | data[13].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[14].name          | randomString                |
                  | data[14].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[15].name          | randomString                |
                  | data[15].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[16].name          | randomString                |
                  | data[16].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[17].name          | randomString                |
                  | data[17].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[18].name          | randomString                |
                  | data[18].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[19].name          | randomString                |
                  | data[19].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[20].name          | randomString                |
                  | data[20].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[21].name          | randomString                |
                  | data[21].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[22].name          | randomString                |
                  | data[22].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[23].name          | randomString                |
                  | data[23].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[24].name          | randomString                |
                  | data[24].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[25].name          | randomString                |
                  | data[25].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[26].name          | randomString                |
                  | data[26].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[27].name          | randomString                |
                  | data[27].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[28].name          | randomString                |
                  | data[28].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[29].name          | randomString                |
                  | data[29].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[30].name          | randomString                |
                  | data[30].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[31].name          | randomString                |
                  | data[31].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[32].name          | randomString                |
                  | data[32].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[33].name          | randomString                |
                  | data[33].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[34].name          | randomString                |
                  | data[34].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[35].name          | randomString                |
                  | data[35].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[36].name          | randomString                |
                  | data[36].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[37].name          | randomString                |
                  | data[37].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[38].name          | randomString                |
                  | data[38].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[39].name          | randomString                |
                  | data[39].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[40].name          | randomString                |
                  | data[40].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[41].name          | randomString                |
                  | data[41].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[42].name          | randomString                |
                  | data[42].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[43].name          | randomString                |
                  | data[43].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[44].name          | randomString                |
                  | data[44].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[45].name          | randomString                |
                  | data[45].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[46].name          | randomString                |
                  | data[46].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[47].name          | randomString                |
                  | data[47].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[48].name          | randomString                |
                  | data[48].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[49].name          | randomString                |
                  | data[49].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[50].name          | randomString                |
                  | data[50].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[51].name          | randomString                |
                  | data[51].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[52].name          | randomString                |
                  | data[52].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[53].name          | randomString                |
                  | data[53].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[54].name          | randomString                |
                  | data[54].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[55].name          | randomString                |
                  | data[55].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[56].name          | randomString                |
                  | data[56].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[57].name          | randomString                |
                  | data[57].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[58].name          | randomString                |
                  | data[58].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[59].name          | randomString                |
                  | data[59].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[60].name          | randomString                |
                  | data[60].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[61].name          | randomString                |
                  | data[61].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[62].name          | randomString                |
                  | data[62].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[63].name          | randomString                |
                  | data[63].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[64].name          | randomString                |
                  | data[64].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[65].name          | randomString                |
                  | data[65].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[66].name          | randomString                |
                  | data[66].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[67].name          | randomString                |
                  | data[67].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[68].name          | randomString                |
                  | data[68].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[69].name          | randomString                |
                  | data[69].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[70].name          | randomString                |
                  | data[70].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[71].name          | randomString                |
                  | data[71].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[72].name          | randomString                |
                  | data[72].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[73].name          | randomString                |
                  | data[73].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[74].name          | randomString                |
                  | data[74].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[75].name          | randomString                |
                  | data[75].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[76].name          | randomString                |
                  | data[76].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[77].name          | randomString                |
                  | data[77].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[78].name          | randomString                |
                  | data[78].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[79].name          | randomString                |
                  | data[79].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[80].name          | randomString                |
                  | data[80].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[81].name          | randomString                |
                  | data[81].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[82].name          | randomString                |
                  | data[82].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[83].name          | randomString                |
                  | data[83].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[84].name          | randomString                |
                  | data[84].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[85].name          | randomString                |
                  | data[85].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[86].name          | randomString                |
                  | data[86].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[87].name          | randomString                |
                  | data[87].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[88].name          | randomString                |
                  | data[88].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[89].name          | randomString                |
                  | data[89].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[90].name          | randomString                |
                  | data[90].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[91].name          | randomString                |
                  | data[91].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[92].name          | randomString                |
                  | data[92].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[93].name          | randomString                |
                  | data[93].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[94].name          | randomString                |
                  | data[94].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[95].name          | randomString                |
                  | data[95].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[96].name          | randomString                |
                  | data[96].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[97].name          | randomString                |
                  | data[97].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[98].name          | randomString                |
                  | data[98].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[99].name          | randomString                |
                  | data[99].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[100].name         | randomString                |
                  | data[100].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[101].name         | randomString                |
                  | data[101].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[102].name         | randomString                |
                  | data[102].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[103].name         | randomString                |
                  | data[103].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[104].name         | randomString                |
                  | data[104].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[105].name         | randomString                |
                  | data[105].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[106].name         | randomString                |
                  | data[106].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[107].name         | randomString                |
                  | data[107].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[108].name         | randomString                |
                  | data[108].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[109].name         | randomString                |
                  | data[109].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[110].name         | randomString                |
                  | data[110].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[111].name         | randomString                |
                  | data[111].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[112].name         | randomString                |
                  | data[112].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[113].name         | randomString                |
                  | data[113].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[114].name         | randomString                |
                  | data[114].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[115].name         | randomString                |
                  | data[115].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[116].name         | randomString                |
                  | data[116].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[117].name         | randomString                |
                  | data[117].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[118].name         | randomString                |
                  | data[118].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[119].name         | randomString                |
                  | data[119].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[120].name         | randomString                |
                  | data[120].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[121].name         | randomString                |
                  | data[121].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[122].name         | randomString                |
                  | data[122].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[123].name         | randomString                |
                  | data[123].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[124].name         | randomString                |
                  | data[124].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[125].name         | randomString                |
                  | data[125].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[126].name         | randomString                |
                  | data[126].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[127].name         | randomString                |
                  | data[127].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[128].name         | randomString                |
                  | data[128].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[129].name         | randomString                |
                  | data[129].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[130].name         | randomString                |
                  | data[130].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[131].name         | randomString                |
                  | data[131].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[132].name         | randomString                |
                  | data[132].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[133].name         | randomString                |
                  | data[133].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[134].name         | randomString                |
                  | data[134].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[135].name         | randomString                |
                  | data[135].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[136].name         | randomString                |
                  | data[136].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[137].name         | randomString                |
                  | data[137].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[138].name         | randomString                |
                  | data[138].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[139].name         | randomString                |
                  | data[139].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[140].name         | randomString                |
                  | data[140].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[141].name         | randomString                |
                  | data[141].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[142].name         | randomString                |
                  | data[142].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[143].name         | randomString                |
                  | data[143].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[144].name         | randomString                |
                  | data[144].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[145].name         | randomString                |
                  | data[145].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[146].name         | randomString                |
                  | data[146].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[147].name         | randomString                |
                  | data[147].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[148].name         | randomString                |
                  | data[148].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[149].name         | randomString                |
                  | data[149].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[150].name         | randomString                |
                  | data[150].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[151].name         | randomString                |
                  | data[151].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[152].name         | randomString                |
                  | data[152].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[153].name         | randomString                |
                  | data[153].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[154].name         | randomString                |
                  | data[154].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[155].name         | randomString                |
                  | data[155].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[156].name         | randomString                |
                  | data[156].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[157].name         | randomString                |
                  | data[157].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[158].name         | randomString                |
                  | data[158].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[159].name         | randomString                |
                  | data[159].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[160].name         | randomString                |
                  | data[160].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[161].name         | randomString                |
                  | data[161].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[162].name         | randomString                |
                  | data[162].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[163].name         | randomString                |
                  | data[163].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[164].name         | randomString                |
                  | data[164].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[165].name         | randomString                |
                  | data[165].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[166].name         | randomString                |
                  | data[166].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[167].name         | randomString                |
                  | data[167].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[168].name         | randomString                |
                  | data[168].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[169].name         | randomString                |
                  | data[169].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[170].name         | randomString                |
                  | data[170].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[171].name         | randomString                |
                  | data[171].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[172].name         | randomString                |
                  | data[172].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[173].name         | randomString                |
                  | data[173].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[174].name         | randomString                |
                  | data[174].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[175].name         | randomString                |
                  | data[175].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[176].name         | randomString                |
                  | data[176].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[177].name         | randomString                |
                  | data[177].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[178].name         | randomString                |
                  | data[178].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[179].name         | randomString                |
                  | data[179].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[180].name         | randomString                |
                  | data[180].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[181].name         | randomString                |
                  | data[181].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[182].name         | randomString                |
                  | data[182].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[183].name         | randomString                |
                  | data[183].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[184].name         | randomString                |
                  | data[184].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[185].name         | randomString                |
                  | data[185].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[186].name         | randomString                |
                  | data[186].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[187].name         | randomString                |
                  | data[187].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[188].name         | randomString                |
                  | data[188].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[189].name         | randomString                |
                  | data[189].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[190].name         | randomString                |
                  | data[190].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[191].name         | randomString                |
                  | data[191].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[192].name         | randomString                |
                  | data[192].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[193].name         | randomString                |
                  | data[193].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[194].name         | randomString                |
                  | data[194].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[195].name         | randomString                |
                  | data[195].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[196].name         | randomString                |
                  | data[196].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[197].name         | randomString                |
                  | data[197].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[198].name         | randomString                |
                  | data[198].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[199].name         | randomString                |
                  | data[199].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[200].name         | randomString                |
                  | data[200].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[201].name         | randomString                |
                  | data[201].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[202].name         | randomString                |
                  | data[202].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[203].name         | randomString                |
                  | data[203].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[204].name         | randomString                |
                  | data[204].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[205].name         | randomString                |
                  | data[205].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[206].name         | randomString                |
                  | data[206].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[207].name         | randomString                |
                  | data[207].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[208].name         | randomString                |
                  | data[208].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[209].name         | randomString                |
                  | data[209].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[210].name         | randomString                |
                  | data[210].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[211].name         | randomString                |
                  | data[211].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[212].name         | randomString                |
                  | data[212].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[213].name         | randomString                |
                  | data[213].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[214].name         | randomString                |
                  | data[214].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[215].name         | randomString                |
                  | data[215].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[216].name         | randomString                |
                  | data[216].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[217].name         | randomString                |
                  | data[217].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[218].name         | randomString                |
                  | data[218].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[219].name         | randomString                |
                  | data[219].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[220].name         | randomString                |
                  | data[220].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[221].name         | randomString                |
                  | data[221].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[222].name         | randomString                |
                  | data[222].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[223].name         | randomString                |
                  | data[223].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[224].name         | randomString                |
                  | data[224].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[225].name         | randomString                |
                  | data[225].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[226].name         | randomString                |
                  | data[226].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[227].name         | randomString                |
                  | data[227].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[228].name         | randomString                |
                  | data[228].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[229].name         | randomString                |
                  | data[229].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[230].name         | randomString                |
                  | data[230].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[231].name         | randomString                |
                  | data[231].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[232].name         | randomString                |
                  | data[232].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[233].name         | randomString                |
                  | data[233].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[234].name         | randomString                |
                  | data[234].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[235].name         | randomString                |
                  | data[235].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[236].name         | randomString                |
                  | data[236].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[237].name         | randomString                |
                  | data[237].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[238].name         | randomString                |
                  | data[238].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[239].name         | randomString                |
                  | data[239].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[240].name         | randomString                |
                  | data[240].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[241].name         | randomString                |
                  | data[241].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[242].name         | randomString                |
                  | data[242].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[243].name         | randomString                |
                  | data[243].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[244].name         | randomString                |
                  | data[244].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[245].name         | randomString                |
                  | data[245].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[246].name         | randomString                |
                  | data[246].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[247].name         | randomString                |
                  | data[247].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[248].name         | randomString                |
                  | data[248].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[249].name         | randomString                |
                  | data[249].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[250].name         | randomString                |
                  | data[250].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[251].name         | randomString                |
                  | data[251].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[252].name         | randomString                |
                  | data[252].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[253].name         | randomString                |
                  | data[253].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[254].name         | randomString                |
                  | data[254].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[255].name         | randomString                |
                  | data[255].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[256].name         | randomString                |
                  | data[256].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[257].name         | randomString                |
                  | data[257].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[258].name         | randomString                |
                  | data[258].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[259].name         | randomString                |
                  | data[259].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[260].name         | randomString                |
                  | data[260].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[261].name         | randomString                |
                  | data[261].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[262].name         | randomString                |
                  | data[262].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[263].name         | randomString                |
                  | data[263].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[264].name         | randomString                |
                  | data[264].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[265].name         | randomString                |
                  | data[265].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[266].name         | randomString                |
                  | data[266].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[267].name         | randomString                |
                  | data[267].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[268].name         | randomString                |
                  | data[268].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[269].name         | randomString                |
                  | data[269].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[270].name         | randomString                |
                  | data[270].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[271].name         | randomString                |
                  | data[271].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[272].name         | randomString                |
                  | data[272].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[273].name         | randomString                |
                  | data[273].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[274].name         | randomString                |
                  | data[274].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[275].name         | randomString                |
                  | data[275].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[276].name         | randomString                |
                  | data[276].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[277].name         | randomString                |
                  | data[277].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[278].name         | randomString                |
                  | data[278].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[279].name         | randomString                |
                  | data[279].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[280].name         | randomString                |
                  | data[280].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[281].name         | randomString                |
                  | data[281].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[282].name         | randomString                |
                  | data[282].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[283].name         | randomString                |
                  | data[283].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[284].name         | randomString                |
                  | data[284].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[285].name         | randomString                |
                  | data[285].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[286].name         | randomString                |
                  | data[286].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[287].name         | randomString                |
                  | data[287].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[288].name         | randomString                |
                  | data[288].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[289].name         | randomString                |
                  | data[289].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[290].name         | randomString                |
                  | data[290].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[291].name         | randomString                |
                  | data[291].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[292].name         | randomString                |
                  | data[292].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[293].name         | randomString                |
                  | data[293].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[294].name         | randomString                |
                  | data[294].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[295].name         | randomString                |
                  | data[295].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[296].name         | randomString                |
                  | data[296].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[297].name         | randomString                |
                  | data[297].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[298].name         | randomString                |
                  | data[298].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[299].name         | randomString                |
                  | data[299].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[300].name         | randomString                |
                  | data[300].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[301].name         | randomString                |
                  | data[301].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[302].name         | randomString                |
                  | data[302].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[303].name         | randomString                |
                  | data[303].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[304].name         | randomString                |
                  | data[304].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[305].name         | randomString                |
                  | data[305].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[306].name         | randomString                |
                  | data[306].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[307].name         | randomString                |
                  | data[307].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[308].name         | randomString                |
                  | data[308].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[309].name         | randomString                |
                  | data[309].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[310].name         | randomString                |
                  | data[310].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[311].name         | randomString                |
                  | data[311].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[312].name         | randomString                |
                  | data[312].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[313].name         | randomString                |
                  | data[313].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[314].name         | randomString                |
                  | data[314].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[315].name         | randomString                |
                  | data[315].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[316].name         | randomString                |
                  | data[316].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[317].name         | randomString                |
                  | data[317].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[318].name         | randomString                |
                  | data[318].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[319].name         | randomString                |
                  | data[319].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[320].name         | randomString                |
                  | data[320].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[321].name         | randomString                |
                  | data[321].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[322].name         | randomString                |
                  | data[322].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[323].name         | randomString                |
                  | data[323].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[324].name         | randomString                |
                  | data[324].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[325].name         | randomString                |
                  | data[325].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[326].name         | randomString                |
                  | data[326].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[327].name         | randomString                |
                  | data[327].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[328].name         | randomString                |
                  | data[328].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[329].name         | randomString                |
                  | data[329].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[330].name         | randomString                |
                  | data[330].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[331].name         | randomString                |
                  | data[331].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[332].name         | randomString                |
                  | data[332].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[333].name         | randomString                |
                  | data[333].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[334].name         | randomString                |
                  | data[334].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[335].name         | randomString                |
                  | data[335].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[336].name         | randomString                |
                  | data[336].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[337].name         | randomString                |
                  | data[337].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[338].name         | randomString                |
                  | data[338].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[339].name         | randomString                |
                  | data[339].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[340].name         | randomString                |
                  | data[340].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[341].name         | randomString                |
                  | data[341].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[342].name         | randomString                |
                  | data[342].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[343].name         | randomString                |
                  | data[343].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[344].name         | randomString                |
                  | data[344].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[345].name         | randomString                |
                  | data[345].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[346].name         | randomString                |
                  | data[346].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[347].name         | randomString                |
                  | data[347].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[348].name         | randomString                |
                  | data[348].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[349].name         | randomString                |
                  | data[349].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[350].name         | randomString                |
                  | data[350].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[351].name         | randomString                |
                  | data[351].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[352].name         | randomString                |
                  | data[352].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[353].name         | randomString                |
                  | data[353].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[354].name         | randomString                |
                  | data[354].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[355].name         | randomString                |
                  | data[355].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[356].name         | randomString                |
                  | data[356].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[357].name         | randomString                |
                  | data[357].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[358].name         | randomString                |
                  | data[358].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[359].name         | randomString                |
                  | data[359].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[360].name         | randomString                |
                  | data[360].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[361].name         | randomString                |
                  | data[361].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[362].name         | randomString                |
                  | data[362].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[363].name         | randomString                |
                  | data[363].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[364].name         | randomString                |
                  | data[364].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[365].name         | randomString                |
                  | data[365].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[366].name         | randomString                |
                  | data[366].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[367].name         | randomString                |
                  | data[367].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[368].name         | randomString                |
                  | data[368].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[369].name         | randomString                |
                  | data[369].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[370].name         | randomString                |
                  | data[370].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[371].name         | randomString                |
                  | data[371].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[372].name         | randomString                |
                  | data[372].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[373].name         | randomString                |
                  | data[373].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[374].name         | randomString                |
                  | data[374].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[375].name         | randomString                |
                  | data[375].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[376].name         | randomString                |
                  | data[376].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[377].name         | randomString                |
                  | data[377].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[378].name         | randomString                |
                  | data[378].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[379].name         | randomString                |
                  | data[379].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[380].name         | randomString                |
                  | data[380].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[381].name         | randomString                |
                  | data[381].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[382].name         | randomString                |
                  | data[382].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[383].name         | randomString                |
                  | data[383].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[384].name         | randomString                |
                  | data[384].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[385].name         | randomString                |
                  | data[385].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[386].name         | randomString                |
                  | data[386].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[387].name         | randomString                |
                  | data[387].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[388].name         | randomString                |
                  | data[388].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[389].name         | randomString                |
                  | data[389].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[390].name         | randomString                |
                  | data[390].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[391].name         | randomString                |
                  | data[391].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[392].name         | randomString                |
                  | data[392].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[393].name         | randomString                |
                  | data[393].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[394].name         | randomString                |
                  | data[394].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[395].name         | randomString                |
                  | data[395].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[396].name         | randomString                |
                  | data[396].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[397].name         | randomString                |
                  | data[397].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[398].name         | randomString                |
                  | data[398].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[399].name         | randomString                |
                  | data[399].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[400].name         | randomString                |
                  | data[400].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[401].name         | randomString                |
                  | data[401].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[402].name         | randomString                |
                  | data[402].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[403].name         | randomString                |
                  | data[403].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[404].name         | randomString                |
                  | data[404].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[405].name         | randomString                |
                  | data[405].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[406].name         | randomString                |
                  | data[406].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[407].name         | randomString                |
                  | data[407].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[408].name         | randomString                |
                  | data[408].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[409].name         | randomString                |
                  | data[409].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[410].name         | randomString                |
                  | data[410].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[411].name         | randomString                |
                  | data[411].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[412].name         | randomString                |
                  | data[412].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[413].name         | randomString                |
                  | data[413].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[414].name         | randomString                |
                  | data[414].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[415].name         | randomString                |
                  | data[415].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[416].name         | randomString                |
                  | data[416].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[417].name         | randomString                |
                  | data[417].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[418].name         | randomString                |
                  | data[418].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[419].name         | randomString                |
                  | data[419].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[420].name         | randomString                |
                  | data[420].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[421].name         | randomString                |
                  | data[421].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[422].name         | randomString                |
                  | data[422].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[423].name         | randomString                |
                  | data[423].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[424].name         | randomString                |
                  | data[424].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[425].name         | randomString                |
                  | data[425].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[426].name         | randomString                |
                  | data[426].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[427].name         | randomString                |
                  | data[427].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[428].name         | randomString                |
                  | data[428].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[429].name         | randomString                |
                  | data[429].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[430].name         | randomString                |
                  | data[430].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[431].name         | randomString                |
                  | data[431].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[432].name         | randomString                |
                  | data[432].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[433].name         | randomString                |
                  | data[433].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[434].name         | randomString                |
                  | data[434].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[435].name         | randomString                |
                  | data[435].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[436].name         | randomString                |
                  | data[436].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[437].name         | randomString                |
                  | data[437].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[438].name         | randomString                |
                  | data[438].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[439].name         | randomString                |
                  | data[439].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[440].name         | randomString                |
                  | data[440].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[441].name         | randomString                |
                  | data[441].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[442].name         | randomString                |
                  | data[442].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[443].name         | randomString                |
                  | data[443].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[444].name         | randomString                |
                  | data[444].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[445].name         | randomString                |
                  | data[445].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[446].name         | randomString                |
                  | data[446].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[447].name         | randomString                |
                  | data[447].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[448].name         | randomString                |
                  | data[448].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[449].name         | randomString                |
                  | data[449].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[450].name         | randomString                |
                  | data[450].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[451].name         | randomString                |
                  | data[451].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[452].name         | randomString                |
                  | data[452].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[453].name         | randomString                |
                  | data[453].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[454].name         | randomString                |
                  | data[454].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[455].name         | randomString                |
                  | data[455].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[456].name         | randomString                |
                  | data[456].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[457].name         | randomString                |
                  | data[457].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[458].name         | randomString                |
                  | data[458].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[459].name         | randomString                |
                  | data[459].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[460].name         | randomString                |
                  | data[460].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[461].name         | randomString                |
                  | data[461].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[462].name         | randomString                |
                  | data[462].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[463].name         | randomString                |
                  | data[463].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[464].name         | randomString                |
                  | data[464].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[465].name         | randomString                |
                  | data[465].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[466].name         | randomString                |
                  | data[466].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[467].name         | randomString                |
                  | data[467].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[468].name         | randomString                |
                  | data[468].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[469].name         | randomString                |
                  | data[469].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[470].name         | randomString                |
                  | data[470].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[471].name         | randomString                |
                  | data[471].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[472].name         | randomString                |
                  | data[472].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[473].name         | randomString                |
                  | data[473].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[474].name         | randomString                |
                  | data[474].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[475].name         | randomString                |
                  | data[475].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[476].name         | randomString                |
                  | data[476].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[477].name         | randomString                |
                  | data[477].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[478].name         | randomString                |
                  | data[478].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[479].name         | randomString                |
                  | data[479].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[480].name         | randomString                |
                  | data[480].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[481].name         | randomString                |
                  | data[481].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[482].name         | randomString                |
                  | data[482].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[483].name         | randomString                |
                  | data[483].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[484].name         | randomString                |
                  | data[484].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[485].name         | randomString                |
                  | data[485].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[486].name         | randomString                |
                  | data[486].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[487].name         | randomString                |
                  | data[487].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[488].name         | randomString                |
                  | data[488].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[489].name         | randomString                |
                  | data[489].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[490].name         | randomString                |
                  | data[490].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[491].name         | randomString                |
                  | data[491].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[492].name         | randomString                |
                  | data[492].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[493].name         | randomString                |
                  | data[493].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[494].name         | randomString                |
                  | data[494].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[495].name         | randomString                |
                  | data[495].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[496].name         | randomString                |
                  | data[496].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[497].name         | randomString                |
                  | data[497].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[498].name         | randomString                |
                  | data[498].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[499].name         | randomString                |
                  | data[499].warehouse_id | DB:warehouses:id:isactive=1 |
             When I post the request with "insertBulkMdmData_area_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath    | Value                      |
                  | Result   | true                       |
                  | Reason.1 | Data Uploaded Successfully |
                  | Reason.2 | Data Uploaded Successfully |

        @AreaTest34
        Scenario: AreaMDM:AreaTest34 - Data verification by passing all the mandatory field values for bulk upload
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertBulkMdmData_area_MDM" payload
                  | JPath                  | Value                       |
                  | data[0].name           | randomString                |
                  | data[0].warehouse_id   | DB:warehouses:id:isactive=0 |
                  | data[1].name           | randomString                |
                  | data[1].warehouse_id   | DB:warehouses:id:isactive=1 |
                  | data[2].name           | randomString                |
                  | data[2].warehouse_id   | DB:warehouses:id:isactive=1 |
                  | data[3].name           | randomString                |
                  | data[3].warehouse_id   | DB:warehouses:id:isactive=1 |
                  | data[4].name           | randomString                |
                  | data[4].warehouse_id   | DB:warehouses:id:isactive=1 |
                  | data[5].name           | randomString                |
                  | data[5].warehouse_id   | DB:warehouses:id:isactive=0 |
                  | data[6].name           | randomString                |
                  | data[6].warehouse_id   | DB:warehouses:id:isactive=1 |
                  | data[7].name           | randomString                |
                  | data[7].warehouse_id   | DB:warehouses:id:isactive=1 |
                  | data[8].name           | randomString                |
                  | data[8].warehouse_id   | DB:warehouses:id:isactive=1 |
                  | data[9].name           | randomString                |
                  | data[9].warehouse_id   | DB:warehouses:id:isactive=1 |
                  | data[10].name          | randomString                |
                  | data[10].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[11].name          | randomString                |
                  | data[11].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[12].name          | randomString                |
                  | data[12].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[13].name          | randomString                |
                  | data[13].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[14].name          | randomString                |
                  | data[14].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[15].name          | randomString                |
                  | data[15].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[16].name          | randomString                |
                  | data[16].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[17].name          | randomString                |
                  | data[17].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[18].name          | randomString                |
                  | data[18].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[19].name          | randomString                |
                  | data[19].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[20].name          | randomString                |
                  | data[20].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[21].name          | randomString                |
                  | data[21].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[22].name          | randomString                |
                  | data[22].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[23].name          | randomString                |
                  | data[23].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[24].name          | randomString                |
                  | data[24].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[25].name          | randomString                |
                  | data[25].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[26].name          | randomString                |
                  | data[26].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[27].name          | randomString                |
                  | data[27].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[28].name          | randomString                |
                  | data[28].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[29].name          | randomString                |
                  | data[29].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[30].name          | randomString                |
                  | data[30].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[31].name          | randomString                |
                  | data[31].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[32].name          | randomString                |
                  | data[32].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[33].name          | randomString                |
                  | data[33].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[34].name          | randomString                |
                  | data[34].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[35].name          | randomString                |
                  | data[35].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[36].name          | randomString                |
                  | data[36].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[37].name          | randomString                |
                  | data[37].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[38].name          | randomString                |
                  | data[38].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[39].name          | randomString                |
                  | data[39].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[40].name          | randomString                |
                  | data[40].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[41].name          | randomString                |
                  | data[41].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[42].name          | randomString                |
                  | data[42].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[43].name          | randomString                |
                  | data[43].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[44].name          | randomString                |
                  | data[44].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[45].name          | randomString                |
                  | data[45].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[46].name          | randomString                |
                  | data[46].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[47].name          | randomString                |
                  | data[47].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[48].name          | randomString                |
                  | data[48].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[49].name          | randomString                |
                  | data[49].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[50].name          | randomString                |
                  | data[50].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[51].name          | randomString                |
                  | data[51].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[52].name          | randomString                |
                  | data[52].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[53].name          | randomString                |
                  | data[53].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[54].name          | randomString                |
                  | data[54].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[55].name          | randomString                |
                  | data[55].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[56].name          | randomString                |
                  | data[56].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[57].name          | randomString                |
                  | data[57].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[58].name          | randomString                |
                  | data[58].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[59].name          | randomString                |
                  | data[59].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[60].name          | randomString                |
                  | data[60].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[61].name          | randomString                |
                  | data[61].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[62].name          | randomString                |
                  | data[62].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[63].name          | randomString                |
                  | data[63].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[64].name          | randomString                |
                  | data[64].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[65].name          | randomString                |
                  | data[65].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[66].name          | randomString                |
                  | data[66].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[67].name          | randomString                |
                  | data[67].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[68].name          | randomString                |
                  | data[68].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[69].name          | randomString                |
                  | data[69].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[70].name          | randomString                |
                  | data[70].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[71].name          | randomString                |
                  | data[71].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[72].name          | randomString                |
                  | data[72].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[73].name          | randomString                |
                  | data[73].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[74].name          | randomString                |
                  | data[74].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[75].name          | randomString                |
                  | data[75].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[76].name          | randomString                |
                  | data[76].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[77].name          | randomString                |
                  | data[77].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[78].name          | randomString                |
                  | data[78].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[79].name          | randomString                |
                  | data[79].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[80].name          | randomString                |
                  | data[80].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[81].name          | randomString                |
                  | data[81].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[82].name          | randomString                |
                  | data[82].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[83].name          | randomString                |
                  | data[83].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[84].name          | randomString                |
                  | data[84].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[85].name          | randomString                |
                  | data[85].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[86].name          | randomString                |
                  | data[86].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[87].name          | randomString                |
                  | data[87].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[88].name          | randomString                |
                  | data[88].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[89].name          | randomString                |
                  | data[89].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[90].name          | randomString                |
                  | data[90].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[91].name          | randomString                |
                  | data[91].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[92].name          | randomString                |
                  | data[92].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[93].name          | randomString                |
                  | data[93].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[94].name          | randomString                |
                  | data[94].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[95].name          | randomString                |
                  | data[95].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[96].name          | randomString                |
                  | data[96].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[97].name          | randomString                |
                  | data[97].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[98].name          | randomString                |
                  | data[98].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[99].name          | randomString                |
                  | data[99].warehouse_id  | DB:warehouses:id:isactive=1 |
                  | data[100].name         | randomString                |
                  | data[100].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[101].name         | randomString                |
                  | data[101].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[102].name         | randomString                |
                  | data[102].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[103].name         | randomString                |
                  | data[103].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[104].name         | randomString                |
                  | data[104].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[105].name         | randomString                |
                  | data[105].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[106].name         | randomString                |
                  | data[106].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[107].name         | randomString                |
                  | data[107].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[108].name         | randomString                |
                  | data[108].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[109].name         | randomString                |
                  | data[109].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[110].name         | randomString                |
                  | data[110].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[111].name         | randomString                |
                  | data[111].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[112].name         | randomString                |
                  | data[112].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[113].name         | randomString                |
                  | data[113].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[114].name         | randomString                |
                  | data[114].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[115].name         | randomString                |
                  | data[115].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[116].name         | randomString                |
                  | data[116].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[117].name         | randomString                |
                  | data[117].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[118].name         | randomString                |
                  | data[118].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[119].name         | randomString                |
                  | data[119].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[120].name         | randomString                |
                  | data[120].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[121].name         | randomString                |
                  | data[121].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[122].name         | randomString                |
                  | data[122].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[123].name         | randomString                |
                  | data[123].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[124].name         | randomString                |
                  | data[124].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[125].name         | randomString                |
                  | data[125].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[126].name         | randomString                |
                  | data[126].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[127].name         | randomString                |
                  | data[127].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[128].name         | randomString                |
                  | data[128].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[129].name         | randomString                |
                  | data[129].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[130].name         | randomString                |
                  | data[130].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[131].name         | randomString                |
                  | data[131].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[132].name         | randomString                |
                  | data[132].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[133].name         | randomString                |
                  | data[133].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[134].name         | randomString                |
                  | data[134].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[135].name         | randomString                |
                  | data[135].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[136].name         | randomString                |
                  | data[136].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[137].name         | randomString                |
                  | data[137].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[138].name         | randomString                |
                  | data[138].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[139].name         | randomString                |
                  | data[139].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[140].name         | randomString                |
                  | data[140].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[141].name         | randomString                |
                  | data[141].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[142].name         | randomString                |
                  | data[142].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[143].name         | randomString                |
                  | data[143].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[144].name         | randomString                |
                  | data[144].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[145].name         | randomString                |
                  | data[145].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[146].name         | randomString                |
                  | data[146].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[147].name         | randomString                |
                  | data[147].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[148].name         | randomString                |
                  | data[148].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[149].name         | randomString                |
                  | data[149].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[150].name         | randomString                |
                  | data[150].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[151].name         | randomString                |
                  | data[151].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[152].name         | randomString                |
                  | data[152].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[153].name         | randomString                |
                  | data[153].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[154].name         | randomString                |
                  | data[154].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[155].name         | randomString                |
                  | data[155].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[156].name         | randomString                |
                  | data[156].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[157].name         | randomString                |
                  | data[157].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[158].name         | randomString                |
                  | data[158].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[159].name         | randomString                |
                  | data[159].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[160].name         | randomString                |
                  | data[160].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[161].name         | randomString                |
                  | data[161].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[162].name         | randomString                |
                  | data[162].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[163].name         | randomString                |
                  | data[163].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[164].name         | randomString                |
                  | data[164].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[165].name         | randomString                |
                  | data[165].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[166].name         | randomString                |
                  | data[166].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[167].name         | randomString                |
                  | data[167].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[168].name         | randomString                |
                  | data[168].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[169].name         | randomString                |
                  | data[169].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[170].name         | randomString                |
                  | data[170].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[171].name         | randomString                |
                  | data[171].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[172].name         | randomString                |
                  | data[172].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[173].name         | randomString                |
                  | data[173].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[174].name         | randomString                |
                  | data[174].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[175].name         | randomString                |
                  | data[175].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[176].name         | randomString                |
                  | data[176].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[177].name         | randomString                |
                  | data[177].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[178].name         | randomString                |
                  | data[178].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[179].name         | randomString                |
                  | data[179].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[180].name         | randomString                |
                  | data[180].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[181].name         | randomString                |
                  | data[181].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[182].name         | randomString                |
                  | data[182].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[183].name         | randomString                |
                  | data[183].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[184].name         | randomString                |
                  | data[184].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[185].name         | randomString                |
                  | data[185].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[186].name         | randomString                |
                  | data[186].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[187].name         | randomString                |
                  | data[187].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[188].name         | randomString                |
                  | data[188].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[189].name         | randomString                |
                  | data[189].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[190].name         | randomString                |
                  | data[190].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[191].name         | randomString                |
                  | data[191].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[192].name         | randomString                |
                  | data[192].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[193].name         | randomString                |
                  | data[193].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[194].name         | randomString                |
                  | data[194].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[195].name         | randomString                |
                  | data[195].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[196].name         | randomString                |
                  | data[196].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[197].name         | randomString                |
                  | data[197].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[198].name         | randomString                |
                  | data[198].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[199].name         | randomString                |
                  | data[199].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[200].name         | randomString                |
                  | data[200].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[201].name         | randomString                |
                  | data[201].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[202].name         | randomString                |
                  | data[202].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[203].name         | randomString                |
                  | data[203].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[204].name         | randomString                |
                  | data[204].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[205].name         | randomString                |
                  | data[205].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[206].name         | randomString                |
                  | data[206].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[207].name         | randomString                |
                  | data[207].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[208].name         | randomString                |
                  | data[208].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[209].name         | randomString                |
                  | data[209].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[210].name         | randomString                |
                  | data[210].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[211].name         | randomString                |
                  | data[211].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[212].name         | randomString                |
                  | data[212].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[213].name         | randomString                |
                  | data[213].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[214].name         | randomString                |
                  | data[214].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[215].name         | randomString                |
                  | data[215].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[216].name         | randomString                |
                  | data[216].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[217].name         | randomString                |
                  | data[217].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[218].name         | randomString                |
                  | data[218].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[219].name         | randomString                |
                  | data[219].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[220].name         | randomString                |
                  | data[220].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[221].name         | randomString                |
                  | data[221].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[222].name         | randomString                |
                  | data[222].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[223].name         | randomString                |
                  | data[223].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[224].name         | randomString                |
                  | data[224].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[225].name         | randomString                |
                  | data[225].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[226].name         | randomString                |
                  | data[226].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[227].name         | randomString                |
                  | data[227].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[228].name         | randomString                |
                  | data[228].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[229].name         | randomString                |
                  | data[229].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[230].name         | randomString                |
                  | data[230].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[231].name         | randomString                |
                  | data[231].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[232].name         | randomString                |
                  | data[232].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[233].name         | randomString                |
                  | data[233].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[234].name         | randomString                |
                  | data[234].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[235].name         | randomString                |
                  | data[235].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[236].name         | randomString                |
                  | data[236].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[237].name         | randomString                |
                  | data[237].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[238].name         | randomString                |
                  | data[238].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[239].name         | randomString                |
                  | data[239].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[240].name         | randomString                |
                  | data[240].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[241].name         | randomString                |
                  | data[241].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[242].name         | randomString                |
                  | data[242].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[243].name         | randomString                |
                  | data[243].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[244].name         | randomString                |
                  | data[244].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[245].name         | randomString                |
                  | data[245].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[246].name         | randomString                |
                  | data[246].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[247].name         | randomString                |
                  | data[247].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[248].name         | randomString                |
                  | data[248].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[249].name         | randomString                |
                  | data[249].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[250].name         | randomString                |
                  | data[250].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[251].name         | randomString                |
                  | data[251].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[252].name         | randomString                |
                  | data[252].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[253].name         | randomString                |
                  | data[253].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[254].name         | randomString                |
                  | data[254].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[255].name         | randomString                |
                  | data[255].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[256].name         | randomString                |
                  | data[256].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[257].name         | randomString                |
                  | data[257].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[258].name         | randomString                |
                  | data[258].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[259].name         | randomString                |
                  | data[259].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[260].name         | randomString                |
                  | data[260].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[261].name         | randomString                |
                  | data[261].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[262].name         | randomString                |
                  | data[262].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[263].name         | randomString                |
                  | data[263].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[264].name         | randomString                |
                  | data[264].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[265].name         | randomString                |
                  | data[265].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[266].name         | randomString                |
                  | data[266].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[267].name         | randomString                |
                  | data[267].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[268].name         | randomString                |
                  | data[268].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[269].name         | randomString                |
                  | data[269].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[270].name         | randomString                |
                  | data[270].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[271].name         | randomString                |
                  | data[271].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[272].name         | randomString                |
                  | data[272].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[273].name         | randomString                |
                  | data[273].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[274].name         | randomString                |
                  | data[274].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[275].name         | randomString                |
                  | data[275].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[276].name         | randomString                |
                  | data[276].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[277].name         | randomString                |
                  | data[277].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[278].name         | randomString                |
                  | data[278].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[279].name         | randomString                |
                  | data[279].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[280].name         | randomString                |
                  | data[280].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[281].name         | randomString                |
                  | data[281].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[282].name         | randomString                |
                  | data[282].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[283].name         | randomString                |
                  | data[283].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[284].name         | randomString                |
                  | data[284].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[285].name         | randomString                |
                  | data[285].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[286].name         | randomString                |
                  | data[286].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[287].name         | randomString                |
                  | data[287].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[288].name         | randomString                |
                  | data[288].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[289].name         | randomString                |
                  | data[289].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[290].name         | randomString                |
                  | data[290].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[291].name         | randomString                |
                  | data[291].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[292].name         | randomString                |
                  | data[292].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[293].name         | randomString                |
                  | data[293].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[294].name         | randomString                |
                  | data[294].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[295].name         | randomString                |
                  | data[295].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[296].name         | randomString                |
                  | data[296].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[297].name         | randomString                |
                  | data[297].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[298].name         | randomString                |
                  | data[298].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[299].name         | randomString                |
                  | data[299].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[300].name         | randomString                |
                  | data[300].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[301].name         | randomString                |
                  | data[301].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[302].name         | randomString                |
                  | data[302].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[303].name         | randomString                |
                  | data[303].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[304].name         | randomString                |
                  | data[304].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[305].name         | randomString                |
                  | data[305].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[306].name         | randomString                |
                  | data[306].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[307].name         | randomString                |
                  | data[307].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[308].name         | randomString                |
                  | data[308].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[309].name         | randomString                |
                  | data[309].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[310].name         | randomString                |
                  | data[310].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[311].name         | randomString                |
                  | data[311].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[312].name         | randomString                |
                  | data[312].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[313].name         | randomString                |
                  | data[313].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[314].name         | randomString                |
                  | data[314].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[315].name         | randomString                |
                  | data[315].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[316].name         | randomString                |
                  | data[316].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[317].name         | randomString                |
                  | data[317].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[318].name         | randomString                |
                  | data[318].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[319].name         | randomString                |
                  | data[319].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[320].name         | randomString                |
                  | data[320].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[321].name         | randomString                |
                  | data[321].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[322].name         | randomString                |
                  | data[322].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[323].name         | randomString                |
                  | data[323].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[324].name         | randomString                |
                  | data[324].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[325].name         | randomString                |
                  | data[325].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[326].name         | randomString                |
                  | data[326].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[327].name         | randomString                |
                  | data[327].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[328].name         | randomString                |
                  | data[328].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[329].name         | randomString                |
                  | data[329].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[330].name         | randomString                |
                  | data[330].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[331].name         | randomString                |
                  | data[331].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[332].name         | randomString                |
                  | data[332].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[333].name         | randomString                |
                  | data[333].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[334].name         | randomString                |
                  | data[334].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[335].name         | randomString                |
                  | data[335].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[336].name         | randomString                |
                  | data[336].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[337].name         | randomString                |
                  | data[337].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[338].name         | randomString                |
                  | data[338].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[339].name         | randomString                |
                  | data[339].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[340].name         | randomString                |
                  | data[340].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[341].name         | randomString                |
                  | data[341].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[342].name         | randomString                |
                  | data[342].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[343].name         | randomString                |
                  | data[343].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[344].name         | randomString                |
                  | data[344].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[345].name         | randomString                |
                  | data[345].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[346].name         | randomString                |
                  | data[346].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[347].name         | randomString                |
                  | data[347].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[348].name         | randomString                |
                  | data[348].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[349].name         | randomString                |
                  | data[349].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[350].name         | randomString                |
                  | data[350].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[351].name         | randomString                |
                  | data[351].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[352].name         | randomString                |
                  | data[352].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[353].name         | randomString                |
                  | data[353].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[354].name         | randomString                |
                  | data[354].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[355].name         | randomString                |
                  | data[355].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[356].name         | randomString                |
                  | data[356].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[357].name         | randomString                |
                  | data[357].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[358].name         | randomString                |
                  | data[358].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[359].name         | randomString                |
                  | data[359].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[360].name         | randomString                |
                  | data[360].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[361].name         | randomString                |
                  | data[361].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[362].name         | randomString                |
                  | data[362].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[363].name         | randomString                |
                  | data[363].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[364].name         | randomString                |
                  | data[364].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[365].name         | randomString                |
                  | data[365].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[366].name         | randomString                |
                  | data[366].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[367].name         | randomString                |
                  | data[367].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[368].name         | randomString                |
                  | data[368].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[369].name         | randomString                |
                  | data[369].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[370].name         | randomString                |
                  | data[370].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[371].name         | randomString                |
                  | data[371].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[372].name         | randomString                |
                  | data[372].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[373].name         | randomString                |
                  | data[373].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[374].name         | randomString                |
                  | data[374].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[375].name         | randomString                |
                  | data[375].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[376].name         | randomString                |
                  | data[376].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[377].name         | randomString                |
                  | data[377].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[378].name         | randomString                |
                  | data[378].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[379].name         | randomString                |
                  | data[379].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[380].name         | randomString                |
                  | data[380].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[381].name         | randomString                |
                  | data[381].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[382].name         | randomString                |
                  | data[382].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[383].name         | randomString                |
                  | data[383].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[384].name         | randomString                |
                  | data[384].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[385].name         | randomString                |
                  | data[385].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[386].name         | randomString                |
                  | data[386].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[387].name         | randomString                |
                  | data[387].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[388].name         | randomString                |
                  | data[388].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[389].name         | randomString                |
                  | data[389].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[390].name         | randomString                |
                  | data[390].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[391].name         | randomString                |
                  | data[391].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[392].name         | randomString                |
                  | data[392].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[393].name         | randomString                |
                  | data[393].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[394].name         | randomString                |
                  | data[394].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[395].name         | randomString                |
                  | data[395].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[396].name         | randomString                |
                  | data[396].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[397].name         | randomString                |
                  | data[397].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[398].name         | randomString                |
                  | data[398].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[399].name         | randomString                |
                  | data[399].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[400].name         | randomString                |
                  | data[400].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[401].name         | randomString                |
                  | data[401].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[402].name         | randomString                |
                  | data[402].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[403].name         | randomString                |
                  | data[403].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[404].name         | randomString                |
                  | data[404].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[405].name         | randomString                |
                  | data[405].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[406].name         | randomString                |
                  | data[406].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[407].name         | randomString                |
                  | data[407].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[408].name         | randomString                |
                  | data[408].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[409].name         | randomString                |
                  | data[409].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[410].name         | randomString                |
                  | data[410].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[411].name         | randomString                |
                  | data[411].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[412].name         | randomString                |
                  | data[412].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[413].name         | randomString                |
                  | data[413].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[414].name         | randomString                |
                  | data[414].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[415].name         | randomString                |
                  | data[415].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[416].name         | randomString                |
                  | data[416].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[417].name         | randomString                |
                  | data[417].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[418].name         | randomString                |
                  | data[418].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[419].name         | randomString                |
                  | data[419].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[420].name         | randomString                |
                  | data[420].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[421].name         | randomString                |
                  | data[421].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[422].name         | randomString                |
                  | data[422].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[423].name         | randomString                |
                  | data[423].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[424].name         | randomString                |
                  | data[424].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[425].name         | randomString                |
                  | data[425].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[426].name         | randomString                |
                  | data[426].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[427].name         | randomString                |
                  | data[427].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[428].name         | randomString                |
                  | data[428].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[429].name         | randomString                |
                  | data[429].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[430].name         | randomString                |
                  | data[430].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[431].name         | randomString                |
                  | data[431].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[432].name         | randomString                |
                  | data[432].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[433].name         | randomString                |
                  | data[433].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[434].name         | randomString                |
                  | data[434].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[435].name         | randomString                |
                  | data[435].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[436].name         | randomString                |
                  | data[436].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[437].name         | randomString                |
                  | data[437].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[438].name         | randomString                |
                  | data[438].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[439].name         | randomString                |
                  | data[439].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[440].name         | randomString                |
                  | data[440].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[441].name         | randomString                |
                  | data[441].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[442].name         | randomString                |
                  | data[442].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[443].name         | randomString                |
                  | data[443].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[444].name         | randomString                |
                  | data[444].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[445].name         | randomString                |
                  | data[445].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[446].name         | randomString                |
                  | data[446].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[447].name         | randomString                |
                  | data[447].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[448].name         | randomString                |
                  | data[448].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[449].name         | randomString                |
                  | data[449].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[450].name         | randomString                |
                  | data[450].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[451].name         | randomString                |
                  | data[451].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[452].name         | randomString                |
                  | data[452].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[453].name         | randomString                |
                  | data[453].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[454].name         | randomString                |
                  | data[454].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[455].name         | randomString                |
                  | data[455].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[456].name         | randomString                |
                  | data[456].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[457].name         | randomString                |
                  | data[457].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[458].name         | randomString                |
                  | data[458].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[459].name         | randomString                |
                  | data[459].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[460].name         | randomString                |
                  | data[460].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[461].name         | randomString                |
                  | data[461].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[462].name         | randomString                |
                  | data[462].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[463].name         | randomString                |
                  | data[463].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[464].name         | randomString                |
                  | data[464].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[465].name         | randomString                |
                  | data[465].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[466].name         | randomString                |
                  | data[466].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[467].name         | randomString                |
                  | data[467].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[468].name         | randomString                |
                  | data[468].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[469].name         | randomString                |
                  | data[469].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[470].name         | randomString                |
                  | data[470].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[471].name         | randomString                |
                  | data[471].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[472].name         | randomString                |
                  | data[472].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[473].name         | randomString                |
                  | data[473].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[474].name         | randomString                |
                  | data[474].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[475].name         | randomString                |
                  | data[475].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[476].name         | randomString                |
                  | data[476].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[477].name         | randomString                |
                  | data[477].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[478].name         | randomString                |
                  | data[478].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[479].name         | randomString                |
                  | data[479].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[480].name         | randomString                |
                  | data[480].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[481].name         | randomString                |
                  | data[481].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[482].name         | randomString                |
                  | data[482].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[483].name         | randomString                |
                  | data[483].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[484].name         | randomString                |
                  | data[484].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[485].name         | randomString                |
                  | data[485].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[486].name         | randomString                |
                  | data[486].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[487].name         | randomString                |
                  | data[487].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[488].name         | randomString                |
                  | data[488].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[489].name         | randomString                |
                  | data[489].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[490].name         | randomString                |
                  | data[490].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[491].name         | randomString                |
                  | data[491].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[492].name         | randomString                |
                  | data[492].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[493].name         | randomString                |
                  | data[493].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[494].name         | randomString                |
                  | data[494].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[495].name         | randomString                |
                  | data[495].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[496].name         | randomString                |
                  | data[496].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[497].name         | randomString                |
                  | data[497].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[498].name         | randomString                |
                  | data[498].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[499].name         | randomString                |
                  | data[499].warehouse_id | DB:warehouses:id:isactive=1 |
             When I post the request with "insertBulkMdmData_area_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath  | Value |
                  | Result | false |

        @AreaTest35
        Scenario: AreaMDM:AreaTest35 - In active warehouse id
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_area_MDM" payload
                  | JPath                | Value                       |
                  | data[0].name         | randomString                |
                  | data[0].warehouse_id | DB:warehouses:id:isactive=0 |
                  | data[1].name         | randomString                |
                  | data[1].warehouse_id | DB:warehouses:id:isactive=0 |
             When I post the request with "insertData_area_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And verifies the field is present in the response
                  | JPath             |
                  | Result            |
                  | Reason.1[0].Error |
                  | Reason.2[0].Error |
              And the fields in response should match with expected values
                  | JPath  | Value |
                  | Result | false |
              And verify response time is less than "3000" milliseconds

        @AreaTest36
        Scenario: AreaMDM:AreaTest36 - In active warehouse name
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_area_MDM" payload
                  | JPath                  | Value                         |
                  | data[0].name           | randomString                  |
                  | data[0].warehouse_name | DB:warehouses:name:isactive=0 |
                  | data[1].name           | randomString                  |
                  | data[1].warehouse_name | DB:warehouses:name:isactive=0 |
             When I post the request with "insertData_area_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And verifies the field is present in the response
                  | JPath             |
                  | Result            |
                  | Reason.1[0].Error |
                  | Reason.2[0].Error |
              And the fields in response should match with expected values
                  | JPath  | Value |
                  | Result | false |
              And verify response time is less than "3000" milliseconds

        @AreaTest37
        Scenario: AreaMDM:AreaTest37 - Invalid warehouse id
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_area_MDM" payload
                  | JPath                | Value        |
                  | data[0].name         | randomString |
                  | data[0].warehouse_id | alphabets    |
                  | data[1].name         | randomString |
                  | data[1].warehouse_id | alphabets124 |
             When I post the request with "insertData_area_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And verifies the field is present in the response
                  | JPath             |
                  | Result            |
                  | Reason.1[0].Error |
                  | Reason.2[0].Error |
              And the fields in response should match with expected values
                  | JPath  | Value |
                  | Result | false |
              And verify response time is less than "3000" milliseconds

        @AreaTest38
        Scenario: AreaMDM:AreaTest38 - Invalid warehouse id
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_area_MDM" payload
                  | JPath                | Value        |
                  | data[0].name         | randomString |
                  | data[0].warehouse_id | -12345       |
                  | data[1].name         | randomString |
                  | data[1].warehouse_id | 0            |
             When I post the request with "insertData_area_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And verifies the field is present in the response
                  | JPath             |
                  | Result            |
                  | Reason.1[0].Error |
                  | Reason.2[0].Error |
              And the fields in response should match with expected values
                  | JPath  | Value |
                  | Result | false |
              And verify response time is less than "3000" milliseconds

        @AreaTest39
        Scenario: AreaMDM:AreaTest39 - Empty JSON
            Given I set up base URI for transactions
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
             When I post the request with "insertMdmData_area_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And the fields in response should match with expected values
                  | JPath  | Value |
                  | Result | false |
              And verify response time is less than "3000" milliseconds

        @AreaTest40
        Scenario: AreaMDM:AreaTest40 - collectionseqno & billsequenceno - invalid when decimals or negative enableBillNoGenerationAreaWise=0
            Given I set up base URI for transactions
            Given I update the following columns in "settings" table where "name='enableBillNoGenerationAreaWise'"
                  | column | value |
                  | value  | 0     |
             When I set up request specification
                  | HeaderName   | HeaderValue                        |
                  | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
                  | Content-Type | application/json                   |
              And I modify fields with random values and remove fields in "insertMdmData_area_MDM" payload
                  | JPath                | Value                       |
                  | data[0].name         | randomString                |
                  | data[0].warehouse_id | DB:warehouses:id:isactive=1 |
                  | data[0].category_id  | alphabets                   |
                  | data[1].name         | randomString                |
                  | data[1].warehouse_id | alphabets                   |
                  | data[1].category_id  | 0                           |
             When I post the request with "insertMdmData_area_MDM" payload with dynamic access token and query parameters
                  | Query        | Value        |
                  | access_token | ACCESS_TOKEN |
                  | responsetype | json         |
              And verifies the field is present in the response
                  | JPath             |
                  | Result            |
                  | Reason.1[0].Error |
                  | Reason.2[0].Error |
              And the fields in response should match with expected values
                  | JPath  | Value |
                  | Result | false |
              And verify response time is less than "3000" milliseconds








