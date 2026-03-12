@AppTabSequenceMDM @MDM @Execution

Feature: All testcases of AppTabSequence MDM

  @AppTabSequenceTest1
  Scenario: AppTabSequenceMDM:AppTabSequenceTest1 - Mandatory fields
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath            | Value                                        |
      | data[0].screen   | main                                         |
      | data[0].type     | outletlist                                   |
      | data[0].sequence | randomInt                                    |
      | data[0].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[1].screen   | main                                         |
      | data[1].type     | outletlist                                   |
      | data[1].sequence | randomInt                                    |
      | data[1].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest2
  Scenario: AppTabSequenceMDM:AppTabSequenceTest2 - Data verification by passing the valid data in all the fields
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath              | Value                                        |
      | data[0].screen     | main                                         |
      | data[0].type       | outletlist                                   |
      | data[0].sequence   | randomInt                                    |
      | data[0].user_id    | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[0].compulsory | 1                                            |
      | data[0].is_active  | 1                                            |
      | data[0].status     | 1                                            |
      | data[1].screen     | main                                         |
      | data[1].type       | addoutlet                                    |
      | data[1].sequence   | randomInt                                    |
      | data[1].user_id    | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[1].compulsory | 1                                            |
      | data[1].is_active  | 1                                            |
      | data[1].status     | 1                                            |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                                            | expectedValue |
      | DB:apptabsequences:screen: id=(SELECT MAX(id)-1 FROM apptabsequences)     | main          |
      | DB:apptabsequences:type: id=(SELECT MAX(id)-1 FROM apptabsequences)       | outletlist    |
      | DB:apptabsequences:user_id: id=(SELECT MAX(id)-1 FROM apptabsequences)    | randomString  |
      | DB:apptabsequences:type: id=(SELECT MAX(id)-1 FROM apptabsequences)       | randomString  |
      | DB:apptabsequences:compulsory: id=(SELECT MAX(id)-1 FROM apptabsequences) | true          |
      | DB:apptabsequences:is_active: id=(SELECT MAX(id)-1 FROM apptabsequences)  | true          |
      | DB:apptabsequences:status: id=(SELECT MAX(id)-1 FROM apptabsequences)     | 1             |
      | DB:apptabsequences:screen: id=(SELECT MAX(id) FROM apptabsequences)       | main          |
      | DB:apptabsequences:type: id=(SELECT MAX(id) FROM apptabsequences)         | addoutlet     |
      | DB:apptabsequences:user_id: id=(SELECT MAX(id) FROM apptabsequences)      | randomString  |
      | DB:apptabsequences:type: id=(SELECT MAX(id) FROM apptabsequences)         | randomString  |
      | DB:apptabsequences:compulsory: id=(SELECT MAX(id) FROM apptabsequences)   | true          |
      | DB:apptabsequences:is_active: id=(SELECT MAX(id) FROM apptabsequences)    | true          |
      | DB:apptabsequences:status: id=(SELECT MAX(id) FROM apptabsequences)       | 1             |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest3
  Scenario: AppTabSequenceMDM:AppTabSequenceTest3 - Verify that validation error has thrown when mandatory fields data not passed - screen field
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath            | Value                                        |
      | data[0].type     | outletlist                                   |
      | data[0].sequence | randomInt                                    |
      | data[0].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[0].type     | addoutlet                                    |
      | data[1].sequence | randomInt                                    |
      | data[1].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath              | Value                                       |
      | Result             | false                                       |
      | Reason.1[0].Column | screen                                      |
      | Reason.1[0].Error  | Screen values must 'main' or 'outlet_call'. |
      | Reason.2[0].Column | screen                                      |
      | Reason.2[0].Error  | Screen values must 'main' or 'outlet_call'. |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest4
  Scenario: AppTabSequenceMDM:AppTabSequenceTest4 - Verify that validation error has thrown when mandatory fields data not passed - type field
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath            | Value                                        |
      | data[0].screen   | main                                         |
      | data[0].sequence | randomInt                                    |
      | data[0].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[1].screen   | main                                         |
      | data[1].sequence | randomInt                                    |
      | data[1].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath              | Value                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
      | Result             | false                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
      | Reason.1[0].Column | type                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
      | Reason.2[0].Column | type                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest5
  Scenario: AppTabSequenceMDM:AppTabSequenceTest5 - Verify that validation error has thrown when mandatory fields data not passed - sequence field
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath           | Value                                        |
      | data[0].screen  | main                                         |
      | data[0].type    | outletlist                                   |
      | data[0].user_id | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[1].screen  | main                                         |
      | data[1].type    | outletlist                                   |
      | data[1].user_id | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath              | Value                             |
      | Result             | false                             |
      | Reason.1[0].Column | sequence                          |
      | Reason.1[0].Error  | Sequence must be none zero value. |
      | Reason.2[0].Column | sequence                          |
      | Reason.2[0].Error  | Sequence must be none zero value. |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest6
  Scenario: AppTabSequenceMDM:AppTabSequenceTest6 - Verify that validation error has thrown when mandatory fields data not passed - user id/role id/designation id field
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath            | Value      |
      | data[0].screen   | main       |
      | data[0].type     | outletlist |
      | data[0].sequence | randomInt  |
      | data[1].screen   | main       |
      | data[1].type     | outletlist |
      | data[1].sequence | randomInt  |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath             | Value                                                                   |
      | Result            | false                                                                   |
      | Reason.1[0].Error | Either User id,Role id or Designation id any one can be passed at once. |
      | Reason.2[0].Error | Either User id,Role id or Designation id any one can be passed at once. |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest7
  Scenario:Verify the functioanlity by passing the possible valid values into the screen column
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath              | Value                                        |
      | data[0].screen     | main                                         |
      | data[0].type       | outletlist                                   |
      | data[0].sequence   | randomInt                                    |
      | data[0].user_id    | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[0].compulsory | 1                                            |
      | data[0].is_active  | 1                                            |
      | data[0].status     | 1                                            |
      | data[1].screen     | outlet_call                                  |
      | data[1].type       | outlet_info                                  |
      | data[1].sequence   | randomInt                                    |
      | data[1].user_id    | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[1].compulsory | 1                                            |
      | data[1].is_active  | 1                                            |
      | data[1].status     | 1                                            |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                                            | expectedValue |
      | DB:apptabsequences:screen: id=(SELECT MAX(id)-1 FROM apptabsequences)     | main          |
      | DB:apptabsequences:type: id=(SELECT MAX(id)-1 FROM apptabsequences)       | outletlist    |
      | DB:apptabsequences:user_id: id=(SELECT MAX(id)-1 FROM apptabsequences)    | randomString  |
      | DB:apptabsequences:type: id=(SELECT MAX(id)-1 FROM apptabsequences)       | randomString  |
      | DB:apptabsequences:compulsory: id=(SELECT MAX(id)-1 FROM apptabsequences) | true          |
      | DB:apptabsequences:is_active: id=(SELECT MAX(id)-1 FROM apptabsequences)  | true          |
      | DB:apptabsequences:status: id=(SELECT MAX(id)-1 FROM apptabsequences)     | 1             |
      | DB:apptabsequences:screen: id=(SELECT MAX(id) FROM apptabsequences)       | outlet_call   |
      | DB:apptabsequences:type: id=(SELECT MAX(id) FROM apptabsequences)         | outlet_info   |
      | DB:apptabsequences:user_id: id=(SELECT MAX(id) FROM apptabsequences)      | randomString  |
      | DB:apptabsequences:type: id=(SELECT MAX(id) FROM apptabsequences)         | randomString  |
      | DB:apptabsequences:compulsory: id=(SELECT MAX(id) FROM apptabsequences)   | true          |
      | DB:apptabsequences:is_active: id=(SELECT MAX(id) FROM apptabsequences)    | true          |
      | DB:apptabsequences:status: id=(SELECT MAX(id) FROM apptabsequences)       | 1             |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest8  @AppTabSequenceBugF1x1
  Scenario:Verify the functioanlity by passing the possible valid values into the screen column
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath              | Value                                        |
      | data[0].screen     | outlet_info                                  |
      | data[0].type       | outlet_detail                                |
      | data[0].sequence   | randomInt                                    |
      | data[0].user_id    | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[0].compulsory | 1                                            |
      | data[0].is_active  | 1                                            |
      | data[0].status     | 1                                            |
      | data[1].screen     | order_fulfillment                            |
      | data[1].type       | Order                                        |
      | data[1].sequence   | randomInt                                    |
      | data[1].user_id    | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[1].compulsory | 1                                            |
      | data[1].is_active  | 1                                            |
      | data[1].status     | 1                                            |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                                            | expectedValue     |
      | DB:apptabsequences:screen: id=(SELECT MAX(id)-1 FROM apptabsequences)     | outlet_info       |
      | DB:apptabsequences:type: id=(SELECT MAX(id)-1 FROM apptabsequences)       | outlet_detail     |
      | DB:apptabsequences:user_id: id=(SELECT MAX(id)-1 FROM apptabsequences)    | randomString      |
      | DB:apptabsequences:type: id=(SELECT MAX(id)-1 FROM apptabsequences)       | randomString      |
      | DB:apptabsequences:compulsory: id=(SELECT MAX(id)-1 FROM apptabsequences) | true              |
      | DB:apptabsequences:is_active: id=(SELECT MAX(id)-1 FROM apptabsequences)  | true              |
      | DB:apptabsequences:status: id=(SELECT MAX(id)-1 FROM apptabsequences)     | 1                 |
      | DB:apptabsequences:screen: id=(SELECT MAX(id) FROM apptabsequences)       | order_fulfillment |
      | DB:apptabsequences:type: id=(SELECT MAX(id) FROM apptabsequences)         | Order             |
      | DB:apptabsequences:user_id: id=(SELECT MAX(id) FROM apptabsequences)      | randomString      |
      | DB:apptabsequences:type: id=(SELECT MAX(id) FROM apptabsequences)         | randomString      |
      | DB:apptabsequences:compulsory: id=(SELECT MAX(id) FROM apptabsequences)   | true              |
      | DB:apptabsequences:is_active: id=(SELECT MAX(id) FROM apptabsequences)    | true              |
      | DB:apptabsequences:status: id=(SELECT MAX(id) FROM apptabsequences)       | 1                 |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest9  @AppTabSequenceBugF1x1
  Scenario:Verify the functionality by passing the possible valid values into the screen column
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath              | Value                                        |
      | data[0].screen     | tertiary_sale                                |
      | data[0].type       | Tertiary Sale                                |
      | data[0].sequence   | randomInt                                    |
      | data[0].user_id    | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[0].compulsory | 1                                            |
      | data[0].is_active  | 1                                            |
      | data[0].status     | 1                                            |
      | data[1].screen     | warehouse_info                               |
      | data[1].type       | Warehouse Detail                             |
      | data[1].sequence   | randomInt                                    |
      | data[1].user_id    | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[1].compulsory | 1                                            |
      | data[1].is_active  | 1                                            |
      | data[1].status     | 1                                            |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                                            | expectedValue    |
      | DB:apptabsequences:screen: id=(SELECT MAX(id)-1 FROM apptabsequences)     | tertiary_sale    |
      | DB:apptabsequences:type: id=(SELECT MAX(id)-1 FROM apptabsequences)       | Tertiary Sale    |
      | DB:apptabsequences:user_id: id=(SELECT MAX(id)-1 FROM apptabsequences)    | randomString     |
      | DB:apptabsequences:type: id=(SELECT MAX(id)-1 FROM apptabsequences)       | randomString     |
      | DB:apptabsequences:compulsory: id=(SELECT MAX(id)-1 FROM apptabsequences) | true             |
      | DB:apptabsequences:is_active: id=(SELECT MAX(id)-1 FROM apptabsequences)  | true             |
      | DB:apptabsequences:status: id=(SELECT MAX(id)-1 FROM apptabsequences)     | 1                |
      | DB:apptabsequences:screen: id=(SELECT MAX(id) FROM apptabsequences)       | warehouse_info   |
      | DB:apptabsequences:type: id=(SELECT MAX(id) FROM apptabsequences)         | Warehouse Detail |
      | DB:apptabsequences:user_id: id=(SELECT MAX(id) FROM apptabsequences)      | randomString     |
      | DB:apptabsequences:type: id=(SELECT MAX(id) FROM apptabsequences)         | randomString     |
      | DB:apptabsequences:compulsory: id=(SELECT MAX(id) FROM apptabsequences)   | true             |
      | DB:apptabsequences:is_active: id=(SELECT MAX(id) FROM apptabsequences)    | true             |
      | DB:apptabsequences:status: id=(SELECT MAX(id) FROM apptabsequences)       | 1                |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest10
  Scenario:Verify the functionality by passing duplicate combination of data already exist in db - Based on user id
  The combination of screen, type, type_id, and role_id cannot already exist in the system.
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath              | Value                |
      | data[0].screen     | main                 |
      | data[0].type       | outletlist           |
      | data[0].sequence   | randomInt            |
      | data[0].user_id    | DB:users:id:active=1 |
      | data[0].compulsory | 1                    |
      | data[0].is_active  | 1                    |
      | data[0].status     | 1                    |
      | data[1].screen     | main                 |
      | data[1].type       | outletlist           |
      | data[1].sequence   | randomInt            |
      | data[1].user_id    | DB:users:id:active=1 |
      | data[1].compulsory | 1                    |
      | data[1].is_active  | 1                    |
      | data[1].status     | 1                    |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath             | Value                                                                                    |
      | Result            | false                                                                                    |
      | Reason.2[0].Error | Screen and Type values pair already exist for the given user id\/Designation id\/Role id |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest11
  Scenario:Verify the functionality by passing duplicate combination of data already exist in db - Based on role id
  The combination of screen, type, type_id, and role_id cannot already exist in the system.
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath              | Value                        |
      | data[0].screen     | main                         |
      | data[0].type       | outletlist                   |
      | data[0].sequence   | randomInt                    |
      | data[0].role_id    | DB:roles:id:name IS NOT NULL |
      | data[0].compulsory | 1                            |
      | data[0].is_active  | 1                            |
      | data[0].status     | 1                            |
      | data[1].screen     | main                         |
      | data[1].type       | outletlist                   |
      | data[1].sequence   | randomInt                    |
      | data[1].role_id    | DB:roles:id:name IS NOT NULL |
      | data[1].compulsory | 1                            |
      | data[1].is_active  | 1                            |
      | data[1].status     | 1                            |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath             | Value                                                                                    |
      | Result            | false                                                                                    |
      | Reason.2[0].Error | Screen and Type values pair already exist for the given user id\/Designation id\/Role id |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest12
  Scenario:Verify the functionality by passing duplicate combination of data already exist in db - Based on role id
  The combination of screen, type, type_id, and role_id cannot already exist in the system.
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath                      | Value                          |
      | data[0].screen             | main                           |
      | data[0].type               | outletlist                     |
      | data[0].sequence           | randomInt                      |
      | data[0].['Designation Id'] | DB:designations:id:is_active=1 |
      | data[0].compulsory         | 1                              |
      | data[0].is_active          | 1                              |
      | data[0].status             | 1                              |
      | data[1].screen             | main                           |
      | data[1].type               | outletlist                     |
      | data[1].sequence           | randomInt                      |
      | data[1].['Designation Id'] | DB:designations:id:is_active=1 |
      | data[1].compulsory         | 1                              |
      | data[1].is_active          | 1                              |
      | data[1].status             | 1                              |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath             | Value                                                                                    |
      | Result            | false                                                                                    |
      | Reason.2[0].Error | Screen and Type values pair already exist for the given user id\/Designation id\/Role id |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest13
  Scenario: AppTabSequenceMDM:AppTabSequenceTest13 - Verify the functionality by passing in valid values into screen column
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath            | Value                                        |
      | data[0].screen   | MAIN                                         |
      | data[0].type     | outletlist                                   |
      | data[0].sequence | randomInt                                    |
      | data[0].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[1].screen   | randomString                                 |
      | data[1].type     | outletlist                                   |
      | data[1].sequence | randomInt                                    |
      | data[1].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath              | Value  |
      | Result             | false  |
      | Reason.1[0].Column | screen |
      | Reason.2[0].Column | screen |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest14
  Scenario: AppTabSequenceMDM:AppTabSequenceTest14 - Verify the functionality by passing in valid values into screen column
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath            | Value                                        |
      | data[0].screen   | randomDouble                                 |
      | data[0].type     | outletlist                                   |
      | data[0].sequence | randomInt                                    |
      | data[0].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[1].screen   | randomAsciiCharacters                        |
      | data[1].type     | outletlist                                   |
      | data[1].sequence | randomInt                                    |
      | data[1].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath              | Value  |
      | Result             | false  |
      | Reason.1[0].Column | screen |
      | Reason.2[0].Column | screen |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest15
  Scenario: AppTabSequenceMDM:AppTabSequenceTest15 - Verify the functionality by passing in valid values into screen column
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath            | Value                                        |
      | data[0].screen   | 0                                            |
      | data[0].type     | outletlist                                   |
      | data[0].sequence | randomInt                                    |
      | data[0].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[1].screen   | -100                                         |
      | data[1].type     | outletlist                                   |
      | data[1].sequence | randomInt                                    |
      | data[1].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath              | Value  |
      | Result             | false  |
      | Reason.1[0].Column | screen |
      | Reason.2[0].Column | screen |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest16
  Scenario: AppTabSequenceMDM:AppTabSequenceTest16 - Verify the functionality by passing in valid values into screen column
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath            | Value                                        |
      | data[0].screen   | 0                                            |
      | data[0].type     | outletlist                                   |
      | data[0].sequence | randomInt                                    |
      | data[0].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[1].screen   | -100                                         |
      | data[1].type     | outletlist                                   |
      | data[1].sequence | randomInt                                    |
      | data[1].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath              | Value  |
      | Result             | false  |
      | Reason.1[0].Column | screen |
      | Reason.2[0].Column | screen |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest16
  Scenario: AppTabSequenceMDM:AppTabSequenceTest16 - Verify the functionality by passing in valid values into screen column
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath            | Value                                        |
      | data[0].screen   | 0                                            |
      | data[0].type     | outletlist                                   |
      | data[0].sequence | randomInt                                    |
      | data[0].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[1].screen   | -100                                         |
      | data[1].type     | outletlist                                   |
      | data[1].sequence | randomInt                                    |
      | data[1].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath              | Value  |
      | Result             | false  |
      | Reason.1[0].Column | screen |
      | Reason.2[0].Column | screen |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest17
  Scenario: AppTabSequenceMDM:AppTabSequenceTest17 - Verify the functionality by passing valid and active user -id
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath            | Value                                        |
      | data[0].screen   | main                                         |
      | data[0].type     | outletlist                                   |
      | data[0].sequence | randomInt                                    |
      | data[0].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[1].screen   | main                                         |
      | data[1].type     | outletlist                                   |
      | data[1].sequence | randomInt                                    |
      | data[1].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest18
  Scenario: AppTabSequenceMDM:AppTabSequenceTest18 - Verify the functionality by passing invalid and inactive user -id
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath            | Value                                        |
      | data[0].screen   | main                                         |
      | data[0].type     | outletlist                                   |
      | data[0].sequence | randomInt                                    |
      | data[0].user_id  | DB:users:id:active=0 ORDER BY RAND() LIMIT 1 |
      | data[1].screen   | main                                         |
      | data[1].type     | outletlist                                   |
      | data[1].sequence | randomInt                                    |
      | data[1].user_id  | DB:users:id:active=0 ORDER BY RAND() LIMIT 1 |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath              | Value               |
      | Result             | false               |
      | Reason.1[0].Column | user_id             |
      | Reason.1[0].Error  | User desnot exists. |
      | Reason.2[0].Column | user_id             |
      | Reason.2[0].Error  | User desnot exists. |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest19
  Scenario: AppTabSequenceMDM:AppTabSequenceTest19 - Verify the functionality by passing in valid user id
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath            | Value        |
      | data[0].screen   | main         |
      | data[0].type     | outletlist   |
      | data[0].sequence | randomInt    |
      | data[0].user_id  | randomString |
      | data[1].screen   | main         |
      | data[1].type     | outletlist   |
      | data[1].sequence | randomInt    |
      | data[1].user_id  | 0            |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath              | Value   |
      | Result             | false   |
      | Reason.1[0].Column | user_id |
      | Reason.2[0].Column | user_id |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest20
  Scenario: AppTabSequenceMDM:AppTabSequenceTest20 - Verify the functionality by passing in valid user id
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath            | Value                 |
      | data[0].screen   | main                  |
      | data[0].type     | outletlist            |
      | data[0].sequence | randomInt             |
      | data[0].user_id  | 1.1                   |
      | data[1].screen   | main                  |
      | data[1].type     | outletlist            |
      | data[1].sequence | randomInt             |
      | data[1].user_id  | randomAsciiCharacters |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath              | Value   |
      | Result             | false   |
      | Reason.1[0].Column | user_id |
      | Reason.2[0].Column | user_id |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest21
  Scenario: AppTabSequenceMDM:AppTabSequenceTest21 - Verify the functionality by passing valid designation id -Fails due to same combination already exists
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath                      | Value                          |
      | data[0].screen             | main                           |
      | data[0].type               | outletlist                     |
      | data[0].sequence           | randomInt                      |
      | data[0].['Designation Id'] | DB:designations:id:is_active=1 |
      | data[1].screen             | main                           |
      | data[1].type               | outletlist                     |
      | data[1].sequence           | randomInt                      |
      | data[1].role_id            | DB:roles:id                    |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                                                | expectedValue                  |
      | DB:apptabsequences:screen: id=(SELECT MAX(id)-1 FROM apptabsequences)         | main                           |
      | DB:apptabsequences:type: id=(SELECT MAX(id)-1 FROM apptabsequences)           | outletlist                     |
      | DB:apptabsequences:user_id: id=(SELECT MAX(id)-1 FROM apptabsequences)        | 0                              |
      | DB:apptabsequences:sequence: id=(SELECT MAX(id)-1 FROM apptabsequences)       | randomString                   |
      | DB:apptabsequences:compulsory: id=(SELECT MAX(id)-1 FROM apptabsequences)     | false                          |
      | DB:apptabsequences:is_active: id=(SELECT MAX(id)-1 FROM apptabsequences)      | true                           |
      | DB:apptabsequences:status: id=(SELECT MAX(id)-1 FROM apptabsequences)         | 1                              |
      | DB:apptabsequences:designation_id: id=(SELECT MAX(id)-1 FROM apptabsequences) | DB:designations:id:is_active=1 |
      | DB:apptabsequences:role_id: id=(SELECT MAX(id)-1 FROM apptabsequences)        | 0                              |
      | DB:apptabsequences:screen: id=(SELECT MAX(id) FROM apptabsequences)           | main                           |
      | DB:apptabsequences:type: id=(SELECT MAX(id) FROM apptabsequences)             | addoutlet                      |
      | DB:apptabsequences:user_id: id=(SELECT MAX(id) FROM apptabsequences)          | 0                              |
      | DB:apptabsequences:sequence: id=(SELECT MAX(id) FROM apptabsequences)         | randomString                   |
      | DB:apptabsequences:compulsory: id=(SELECT MAX(id) FROM apptabsequences)       | false                          |
      | DB:apptabsequences:is_active: id=(SELECT MAX(id) FROM apptabsequences)        | true                           |
      | DB:apptabsequences:status: id=(SELECT MAX(id) FROM apptabsequences)           | 0                              |
      | DB:apptabsequences:role_id: id=(SELECT MAX(id) FROM apptabsequences)          | DB:roles:id:name IS NOT NULL   |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest21
  Scenario: AppTabSequenceMDM:AppTabSequenceTest21 - Verify the functionality by passing valid and active designation id/role id -Fails due to same combination already exists
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath                      | Value                          |
      | data[0].screen             | main                           |
      | data[0].type               | outletlist                     |
      | data[0].sequence           | randomInt                      |
      | data[0].['Designation Id'] | DB:designations:id:is_active=1 |
      | data[1].screen             | main                           |
      | data[1].type               | outletlist                     |
      | data[1].sequence           | randomInt                      |
      | data[1].role_id            | DB:roles:id                    |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                                                | expectedValue                  |
      | DB:apptabsequences:screen: id=(SELECT MAX(id)-1 FROM apptabsequences)         | main                           |
      | DB:apptabsequences:type: id=(SELECT MAX(id)-1 FROM apptabsequences)           | outletlist                     |
      | DB:apptabsequences:user_id: id=(SELECT MAX(id)-1 FROM apptabsequences)        | 0                              |
      | DB:apptabsequences:sequence: id=(SELECT MAX(id)-1 FROM apptabsequences)       | randomString                   |
      | DB:apptabsequences:compulsory: id=(SELECT MAX(id)-1 FROM apptabsequences)     | false                          |
      | DB:apptabsequences:is_active: id=(SELECT MAX(id)-1 FROM apptabsequences)      | true                           |
      | DB:apptabsequences:status: id=(SELECT MAX(id)-1 FROM apptabsequences)         | 1                              |
      | DB:apptabsequences:designation_id: id=(SELECT MAX(id)-1 FROM apptabsequences) | DB:designations:id:is_active=1 |
      | DB:apptabsequences:role_id: id=(SELECT MAX(id)-1 FROM apptabsequences)        | 0                              |
      | DB:apptabsequences:screen: id=(SELECT MAX(id) FROM apptabsequences)           | main                           |
      | DB:apptabsequences:type: id=(SELECT MAX(id) FROM apptabsequences)             | addoutlet                      |
      | DB:apptabsequences:user_id: id=(SELECT MAX(id) FROM apptabsequences)          | 0                              |
      | DB:apptabsequences:sequence: id=(SELECT MAX(id) FROM apptabsequences)         | randomString                   |
      | DB:apptabsequences:compulsory: id=(SELECT MAX(id) FROM apptabsequences)       | false                          |
      | DB:apptabsequences:is_active: id=(SELECT MAX(id) FROM apptabsequences)        | true                           |
      | DB:apptabsequences:status: id=(SELECT MAX(id) FROM apptabsequences)           | 0                              |
      | DB:apptabsequences:role_id: id=(SELECT MAX(id) FROM apptabsequences)          | DB:roles:id:name IS NOT NULL   |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest22
  Scenario: AppTabSequenceMDM:AppTabSequenceTest22 - Verify the functionality by passing in active designation id
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath                      | Value                          |
      | data[0].screen             | main                           |
      | data[0].type               | outletlist                     |
      | data[0].sequence           | randomInt                      |
      | data[0].['Designation Id'] | DB:designations:id:is_active=0 |
      | data[1].screen             | main                           |
      | data[1].type               | outletlist                     |
      | data[1].sequence           | randomInt                      |
      | data[1].['Designation Id'] | DB:designations:id:is_active=0 |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath              | Value            |
      | Result             | false            |
      | Reason.1[0].Column | "Designation Id" |
      | Reason.1[0].Column | "Designation Id" |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest23
  Scenario: AppTabSequenceMDM:AppTabSequenceTest23 - Verify the functionality by passing in valid designation id
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath                      | Value        |
      | data[0].screen             | main         |
      | data[0].type               | outletlist   |
      | data[0].sequence           | randomInt    |
      | data[0].['Designation Id'] | randomString |
      | data[1].screen             | main         |
      | data[1].type               | outletlist   |
      | data[1].sequence           | randomInt    |
      | data[1].['Designation Id'] | randomDouble |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath              | Value            |
      | Result             | false            |
      | Reason.1[0].Column | "designation_id" |
      | Reason.1[0].Column | "designation_id" |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest24
  Scenario: AppTabSequenceMDM:AppTabSequenceTest24 - Verify the functionality by passing in valid roles id
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath            | Value        |
      | data[0].screen   | main         |
      | data[0].type     | outletlist   |
      | data[0].sequence | randomInt    |
      | data[0].role_id  | randomString |
      | data[1].screen   | main         |
      | data[1].type     | outletlist   |
      | data[1].sequence | randomInt    |
      | data[1].role_id  | randomDouble |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath              | Value     |
      | Result             | false     |
      | Reason.1[0].Column | "role_id" |
      | Reason.1[0].Column | "role_id" |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest25
  Scenario: AppTabSequenceMDM:AppTabSequenceTest25 - Verify the functionality by passing in valid roles_id and designation
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath                      | Value      |
      | data[0].screen             | main       |
      | data[0].type               | outletlist |
      | data[0].sequence           | randomInt  |
      | data[0].role_id            | 0          |
      | data[1].screen             | main       |
      | data[1].type               | outletlist |
      | data[1].sequence           | randomInt  |
      | data[0].['Designation Id'] | 0          |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath              | Value     |
      | Result             | false     |
      | Reason.1[0].Column | "user_id" |
      | Reason.1[0].Column | "user_id" |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest26
  Scenario: AppTabSequenceMDM:AppTabSequenceTest26 - Verify the functionality by passing the invalid values into the type column
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath            | Value                                        |
      | data[0].screen   | main                                         |
      | data[0].type     | randomString                                 |
      | data[0].sequence | randomInt                                    |
      | data[0].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[1].screen   | main                                         |
      | data[1].type     | randomAsciiCharacters                        |
      | data[1].sequence | randomInt                                    |
      | data[1].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath              | Value |
      | Result             | false |
      | Reason.1[0].Column | type  |
      | Reason.2[0].Column | type  |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest27
  Scenario: AppTabSequenceMDM:AppTabSequenceTest27 - Verify the functionality by passing the invalid values into the type column
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath            | Value                                        |
      | data[0].screen   | main                                         |
      | data[0].type     | randomInt                                    |
      | data[0].sequence | randomInt                                    |
      | data[0].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[1].screen   | main                                         |
      | data[1].type     | randomDouble                                 |
      | data[1].sequence | randomInt                                    |
      | data[1].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath              | Value |
      | Result             | false |
      | Reason.1[0].Column | type  |
      | Reason.2[0].Column | type  |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest28
  Scenario: AppTabSequenceMDM:AppTabSequenceTest28 - Verify the functionality by passing the invalid values into the type column
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath            | Value                                        |
      | data[0].screen   | main                                         |
      | data[0].type     | 0                                            |
      | data[0].sequence | randomInt                                    |
      | data[0].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[1].screen   | main                                         |
      | data[1].type     | -1                                           |
      | data[1].sequence | randomInt                                    |
      | data[1].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath              | Value |
      | Result             | false |
      | Reason.1[0].Column | type  |
      | Reason.2[0].Column | type  |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest29
  Scenario: AppTabSequenceMDM:AppTabSequenceTest29 - Verify the functionality by passing the invalid values into the type column
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath            | Value                                        |
      | data[0].screen   | main                                         |
      | data[0].type     | 0                                            |
      | data[0].sequence | randomInt                                    |
      | data[0].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[1].screen   | main                                         |
      | data[1].type     | -1                                           |
      | data[1].sequence | randomInt                                    |
      | data[1].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath              | Value |
      | Result             | false |
      | Reason.1[0].Column | type  |
      | Reason.2[0].Column | type  |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest30
  Scenario: AppTabSequenceMDM:AppTabSequenceTest30 - Verify the type id is mandatory when the type column value is activity_form/reports/genericform
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath            | Value                                        |
      | data[0].screen   | outlet_call                                  |
      | data[0].type     | activity_form                                |
      | data[0].sequence | randomInt                                    |
      | data[0].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[1].screen   | main                                         |
      | data[1].type     | reports                                      |
      | data[1].sequence | randomInt                                    |
      | data[1].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath              | Value                                                  |
      | Result             | false                                                  |
      | Reason.1[0].Column | type_id                                                |
      | Reason.1[0].Error  | Type Id values are not matching with  activity forms.  |
      | Reason.2[0].Column | type_id                                                |
      | Reason.2[0].Error  | Type Id values are not matching with  report mappings. |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest31
  Scenario: AppTabSequenceMDM:AppTabSequenceTest31 - Verify the type id is mandatory when the type column value is activity_form/reports/genericform
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath            | Value                                        |
      | data[0].screen   | outlet_call                                  |
      | data[0].type     | activity_form                                |
      | data[0].sequence | randomInt                                    |
      | data[0].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[1].screen   | main                                         |
      | data[1].type     | genericform                                  |
      | data[1].sequence | randomInt                                    |
      | data[1].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath              | Value                                                    |
      | Result             | false                                                    |
      | Reason.1[0].Column | type_id                                                  |
      | Reason.1[0].Error  | Type Id values are not matching with  activity forms.    |
      | Reason.2[0].Column | type_id                                                  |
      | Reason.2[0].Error  | Type Id values are not matching with  genericform forms. |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest32
  Scenario: AppTabSequenceMDM:AppTabSequenceTest32 - Verify by passing the valid and active activity form id when the type is activity form
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath            | Value                                        |
      | data[0].screen   | outlet_call                                  |
      | data[0].type     | activity_form                                |
      | data[0].sequence | randomInt                                    |
      | data[0].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[1].type_id  | DB:activityformfields:id:active=1            |
      | data[1].screen   | outlet_call                                  |
      | data[1].type     | activity_form                                |
      | data[1].sequence | randomInt                                    |
      | data[1].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[1].type_id  | DB:activityformfields:id:active=1            |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath  | Value |
      | Result | true  |
    And I verify the data got updated as needed from DB
      | expectedColumn                                                            | expectedValue                     |
      | DB:apptabsequences:screen: id=(SELECT MAX(id)-1 FROM apptabsequences)     | outlet_call                       |
      | DB:apptabsequences:type: id=(SELECT MAX(id)-1 FROM apptabsequences)       | activity_form                     |
      | DB:apptabsequences:type_id: id=(SELECT MAX(id)-1 FROM apptabsequences)    | DB:activityformfields:id:active=1 |
      | DB:apptabsequences:user_id: id=(SELECT MAX(id)-1 FROM apptabsequences)    | randomString                      |
      | DB:apptabsequences:sequence: id=(SELECT MAX(id)-1 FROM apptabsequences)   | randomString                      |
      | DB:apptabsequences:compulsory: id=(SELECT MAX(id)-1 FROM apptabsequences) | false                             |
      | DB:apptabsequences:is_active: id=(SELECT MAX(id)-1 FROM apptabsequences)  | true                              |
      | DB:apptabsequences:status: id=(SELECT MAX(id)-1 FROM apptabsequences)     | 1                                 |
      | DB:apptabsequences:screen: id=(SELECT MAX(id) FROM apptabsequences)       | outlet_call                       |
      | DB:apptabsequences:type: id=(SELECT MAX(id) FROM apptabsequences)         | activity_form                     |
      | DB:apptabsequences:type_id: id=(SELECT MAX(id) FROM apptabsequences)      | DB:activityformfields:id:active=1 |
      | DB:apptabsequences:user_id: id=(SELECT MAX(id) FROM apptabsequences)      | randomString                      |
      | DB:apptabsequences:sequence: id=(SELECT MAX(id) FROM apptabsequences)     | randomString                      |
      | DB:apptabsequences:compulsory: id=(SELECT MAX(id) FROM apptabsequences)   | false                             |
      | DB:apptabsequences:is_active: id=(SELECT MAX(id) FROM apptabsequences)    | true                              |
      | DB:apptabsequences:status: id=(SELECT MAX(id) FROM apptabsequences)       | 1                                 |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest33
  Scenario: AppTabSequenceMDM:AppTabSequenceTest33 - Verify by passing the valid and inactive activity form id when the type is activity form
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath            | Value                                        |
      | data[0].screen   | outlet_call                                  |
      | data[0].type     | activity_form                                |
      | data[0].sequence | randomInt                                    |
      | data[0].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[1].type_id  | DB:activityformfields:id:active=0            |
      | data[1].screen   | outlet_call                                  |
      | data[1].type     | activity_form                                |
      | data[1].sequence | randomInt                                    |
      | data[1].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[1].type_id  | 0                                            |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath             | Value                                                   |
      | Result            | false                                                   |
      | Reason.1[0].Error | "Type Id values are not matching with  activity forms." |
      | Reason.2[0].Error | "Type Id values are not matching with  activity forms." |

  @AppTabSequenceTest34
  Scenario: AppTabSequenceMDM:AppTabSequenceTest34 - Verify by passing the valid and active report mapping id when the type is reports
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath            | Value                                        |
      | data[0].screen   | main                                         |
      | data[0].type     | reports                                      |
      | data[0].sequence | randomInt                                    |
      | data[0].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[0].type_id  | DB:reportmappings:id:is_active=1             |
      | data[1].screen   | main                                         |
      | data[1].type     | reports                                      |
      | data[1].sequence | randomInt                                    |
      | data[1].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[1].type_id  | DB:reportmappings:id:is_active=1             |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath  | Value |
      | Result | true  |
    And I verify the data got updated as needed from DB
      | expectedColumn                                                            | expectedValue                    |
      | DB:apptabsequences:screen: id=(SELECT MAX(id)-1 FROM apptabsequences)     | main                             |
      | DB:apptabsequences:type: id=(SELECT MAX(id)-1 FROM apptabsequences)       | reports                          |
      | DB:apptabsequences:type_id: id=(SELECT MAX(id)-1 FROM apptabsequences)    | DB:reportmappings:id:is_active=1 |
      | DB:apptabsequences:user_id: id=(SELECT MAX(id)-1 FROM apptabsequences)    | randomString                     |
      | DB:apptabsequences:sequence: id=(SELECT MAX(id)-1 FROM apptabsequences)   | randomString                     |
      | DB:apptabsequences:compulsory: id=(SELECT MAX(id)-1 FROM apptabsequences) | false                            |
      | DB:apptabsequences:is_active: id=(SELECT MAX(id)-1 FROM apptabsequences)  | true                             |
      | DB:apptabsequences:status: id=(SELECT MAX(id)-1 FROM apptabsequences)     | 1                                |
      | DB:apptabsequences:screen: id=(SELECT MAX(id) FROM apptabsequences)       | main                             |
      | DB:apptabsequences:type: id=(SELECT MAX(id) FROM apptabsequences)         | reports                          |
      | DB:apptabsequences:type_id: id=(SELECT MAX(id) FROM apptabsequences)      | DB:reportmappings:id:is_active=1 |
      | DB:apptabsequences:user_id: id=(SELECT MAX(id) FROM apptabsequences)      | randomString                     |
      | DB:apptabsequences:sequence: id=(SELECT MAX(id) FROM apptabsequences)     | randomString                     |
      | DB:apptabsequences:compulsory: id=(SELECT MAX(id) FROM apptabsequences)   | false                            |
      | DB:apptabsequences:is_active: id=(SELECT MAX(id) FROM apptabsequences)    | true                             |
      | DB:apptabsequences:status: id=(SELECT MAX(id) FROM apptabsequences)       | 1                                |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest35
  Scenario: AppTabSequenceMDM:AppTabSequenceTest35 - Verify by passing the invalid and inactive report mapping id  when the type is reports
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath            | Value                                        |
      | data[0].screen   | main                                         |
      | data[0].type     | reports                                      |
      | data[0].sequence | randomInt                                    |
      | data[0].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[0].type_id  | DB:reportmappings:id:is_active=0             |
      | data[1].screen   | main                                         |
      | data[1].type     | reports                                      |
      | data[1].sequence | randomInt                                    |
      | data[1].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[1].type_id  | DB:reportmappings:id:is_active=0             |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath              | Value                                                  |
      | Result             | false                                                  |
      | Reason.1[0].Column | type_id                                                |
      | Reason.1[0].Error  | Type Id values are not matching with  report mappings. |
      | Reason.2[0].Column | type_id                                                |
      | Reason.2[0].Error  | Type Id values are not matching with  report mappings. |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest36
  Scenario: AppTabSequenceMDM:AppTabSequenceTest36 - Verify by passing the valid and genericformmapping id when the type is genericforms
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath            | Value                                        |
      | data[0].screen   | main                                         |
      | data[0].type     | genericform                                  |
      | data[0].sequence | randomInt                                    |
      | data[0].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[0].type_id  | DB:genericformfields:id:active=1             |
      | data[1].screen   | main                                         |
      | data[1].type     | genericform                                  |
      | data[1].sequence | randomInt                                    |
      | data[1].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[1].type_id  | DB:genericformfields:id:active=1             |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath  | Value |
      | Result | true  |
    And I verify the data got updated as needed from DB
      | expectedColumn                                                            | expectedValue                    |
      | DB:apptabsequences:screen: id=(SELECT MAX(id)-1 FROM apptabsequences)     | main                             |
      | DB:apptabsequences:type: id=(SELECT MAX(id)-1 FROM apptabsequences)       | genericform                      |
      | DB:apptabsequences:type_id: id=(SELECT MAX(id)-1 FROM apptabsequences)    | DB:genericformfields:id:active=1 |
      | DB:apptabsequences:user_id: id=(SELECT MAX(id)-1 FROM apptabsequences)    | randomString                     |
      | DB:apptabsequences:sequence: id=(SELECT MAX(id)-1 FROM apptabsequences)   | randomString                     |
      | DB:apptabsequences:compulsory: id=(SELECT MAX(id)-1 FROM apptabsequences) | false                            |
      | DB:apptabsequences:is_active: id=(SELECT MAX(id)-1 FROM apptabsequences)  | true                             |
      | DB:apptabsequences:status: id=(SELECT MAX(id)-1 FROM apptabsequences)     | 1                                |
      | DB:apptabsequences:screen: id=(SELECT MAX(id) FROM apptabsequences)       | main                             |
      | DB:apptabsequences:type: id=(SELECT MAX(id) FROM apptabsequences)         | genericform                      |
      | DB:apptabsequences:type_id: id=(SELECT MAX(id) FROM apptabsequences)      | DB:genericformfields:id:active=1 |
      | DB:apptabsequences:user_id: id=(SELECT MAX(id) FROM apptabsequences)      | randomString                     |
      | DB:apptabsequences:sequence: id=(SELECT MAX(id) FROM apptabsequences)     | randomString                     |
      | DB:apptabsequences:compulsory: id=(SELECT MAX(id) FROM apptabsequences)   | false                            |
      | DB:apptabsequences:is_active: id=(SELECT MAX(id) FROM apptabsequences)    | true                             |
      | DB:apptabsequences:status: id=(SELECT MAX(id) FROM apptabsequences)       | 1                                |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest37
  Scenario: AppTabSequenceMDM:AppTabSequenceTest37 - Verify by passing the invalid and inactive genericform mapping id when the type is genericform
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath            | Value                                        |
      | data[0].screen   | main                                         |
      | data[0].type     | genericform                                  |
      | data[0].sequence | randomInt                                    |
      | data[0].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[0].type_id  | DB:genericformfields:id:active=0             |
      | data[1].screen   | main                                         |
      | data[1].type     | genericform                                  |
      | data[1].sequence | randomInt                                    |
      | data[1].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[1].type_id  | DB:genericformfields:id:active=0             |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath              | Value                                                    |
      | Result             | false                                                    |
      | Reason.1[0].Column | type_id                                                  |
      | Reason.1[0].Error  | Type Id values are not matching with  genericform forms. |
      | Reason.2[0].Column | type_id                                                  |
      | Reason.1[0].Error  | Type Id values are not matching with  genericform forms. |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest38
  Scenario: AppTabSequenceMDM:AppTabSequenceTest38 - Verify by passing the invalid values into type id column
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath            | Value                                        |
      | data[0].screen   | main                                         |
      | data[0].type     | genericform                                  |
      | data[0].sequence | randomInt                                    |
      | data[0].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[0].type_id  | randomString                                 |
      | data[1].screen   | main                                         |
      | data[1].type     | reports                                      |
      | data[1].sequence | randomInt                                    |
      | data[1].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[1].type_id  | randomString                                 |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath              | Value   |
      | Result             | false   |
      | Reason.1[0].Column | type_id |
      | Reason.2[0].Column | type_id |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest39
  Scenario: AppTabSequenceMDM:AppTabSequenceTest39 - Verify by passing the invalid values into type id column
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath            | Value                                        |
      | data[0].screen   | main                                         |
      | data[0].type     | genericform                                  |
      | data[0].sequence | randomInt                                    |
      | data[0].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[0].type_id  | randomInt                                    |
      | data[1].screen   | main                                         |
      | data[1].type     | reports                                      |
      | data[1].sequence | randomInt                                    |
      | data[1].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[1].type_id  | randomDouble                                 |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath              | Value   |
      | Result             | false   |
      | Reason.1[0].Column | type_id |
      | Reason.2[0].Column | type_id |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest40
  Scenario: AppTabSequenceMDM:AppTabSequenceTest40 - Verify by passing the invalid values into type id column
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath            | Value                                        |
      | data[0].screen   | main                                         |
      | data[0].type     | genericform                                  |
      | data[0].sequence | randomInt                                    |
      | data[0].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[0].type_id  | 0                                            |
      | data[1].screen   | main                                         |
      | data[1].type     | reports                                      |
      | data[1].sequence | randomInt                                    |
      | data[1].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[1].type_id  | -10                                          |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath              | Value   |
      | Result             | false   |
      | Reason.1[0].Column | type_id |
      | Reason.2[0].Column | type_id |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest41
  Scenario: AppTabSequenceMDM:AppTabSequenceTest41 - Verify by passing the invalid values into type id column
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath            | Value                                        |
      | data[0].screen   | main                                         |
      | data[0].type     | genericform                                  |
      | data[0].sequence | randomInt                                    |
      | data[0].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[0].type_id  | 1.1                                          |
      | data[1].screen   | main                                         |
      | data[1].type     | reports                                      |
      | data[1].sequence | randomInt                                    |
      | data[1].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[1].type_id  | randomAsciiCharacters                        |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath              | Value   |
      | Result             | false   |
      | Reason.1[0].Column | type_id |
      | Reason.2[0].Column | type_id |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest42 @AppTabSequenceTestBugFix
  Scenario: AppTabSequenceMDM:AppTabSequenceTest42 - Valid values into compulsory field,status field, off_location field and is_active 0 and 1
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath                | Value                                        |
      | data[0].screen       | main                                         |
      | data[0].type         | outletlist                                   |
      | data[0].sequence     | randomInt                                    |
      | data[0].user_id      | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[0].compulsory   | 1                                            |
      | data[0].is_active    | 1                                            |
      | data[0].status       | 1                                            |
      | data[0].off_location | 1                                            |
      | data[1].screen       | main                                         |
      | data[1].type         | addoutlet                                    |
      | data[1].sequence     | randomInt                                    |
      | data[1].user_id      | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[1].compulsory   | 0                                            |
      | data[1].is_active    | 0                                            |
      | data[1].status       | 0                                            |
      | data[0].off_location | 0                                            |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                                              | expectedValue |
      | DB:apptabsequences:screen: id=(SELECT MAX(id)-1 FROM apptabsequences)       | main          |
      | DB:apptabsequences:type: id=(SELECT MAX(id)-1 FROM apptabsequences)         | outletlist    |
      | DB:apptabsequences:user_id: id=(SELECT MAX(id)-1 FROM apptabsequences)      | randomString  |
      | DB:apptabsequences:type: id=(SELECT MAX(id)-1 FROM apptabsequences)         | randomString  |
      | DB:apptabsequences:compulsory: id=(SELECT MAX(id)-1 FROM apptabsequences)   | true          |
      | DB:apptabsequences:is_active: id=(SELECT MAX(id)-1 FROM apptabsequences)    | true          |
      | DB:apptabsequences:status: id=(SELECT MAX(id)-1 FROM apptabsequences)       | 1             |
      | DB:apptabsequences:off_location: id=(SELECT MAX(id)-1 FROM apptabsequences) | true          |
      | DB:apptabsequences:screen: id=(SELECT MAX(id) FROM apptabsequences)         | main          |
      | DB:apptabsequences:type: id=(SELECT MAX(id) FROM apptabsequences)           | addoutlet     |
      | DB:apptabsequences:user_id: id=(SELECT MAX(id) FROM apptabsequences)        | randomString  |
      | DB:apptabsequences:type: id=(SELECT MAX(id) FROM apptabsequences)           | randomString  |
      | DB:apptabsequences:compulsory: id=(SELECT MAX(id) FROM apptabsequences)     | false         |
      | DB:apptabsequences:is_active: id=(SELECT MAX(id) FROM apptabsequences)      | false         |
      | DB:apptabsequences:status: id=(SELECT MAX(id) FROM apptabsequences)         | 0             |
      | DB:apptabsequences:off_location: id=(SELECT MAX(id)-1 FROM apptabsequences) | false         |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest43
  Scenario: AppTabSequenceMDM:AppTabSequenceTest43 - InValid values into compulsory field,status field and off_location field -non boolean values
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath                | Value                                        |
      | data[0].screen       | main                                         |
      | data[0].type         | outletlist                                   |
      | data[0].sequence     | randomInt                                    |
      | data[0].user_id      | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[0].compulsory   | 2                                            |
      | data[0].is_active    | 2                                            |
      | data[0].status       | 2                                            |
      | data[0].off_location | 2                                            |
      | data[1].screen       | main                                         |
      | data[1].type         | addoutlet                                    |
      | data[1].sequence     | randomInt                                    |
      | data[1].user_id      | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[1].compulsory   | -1                                           |
      | data[1].is_active    | -1                                           |
      | data[1].status       | -1                                           |
      | data[1].off_location | -1                                           |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath              | Value        |
      | Result             | false        |
      | Reason.1[0].Column | compulsory   |
      | Reason.1[1].Column | is_active    |
      | Reason.1[2].Column | status       |
      | Reason.1[3].Column | off_location |
      | Reason.2[0].Column | compulsory   |
      | Reason.2[1].Column | is_active    |
      | Reason.2[2].Column | status       |
      | Reason.2[3].Column | off_location |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest44
  Scenario: AppTabSequenceMDM:AppTabSequenceTest44 - InValid values into compulsory field,status field -non boolean values
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath              | Value                                        |
      | data[0].screen     | main                                         |
      | data[0].type       | outletlist                                   |
      | data[0].sequence   | randomInt                                    |
      | data[0].user_id    | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[0].compulsory | randomString                                 |
      | data[0].is_active  | randomString                                 |
      | data[0].status     | randomString                                 |
      | data[1].screen     | main                                         |
      | data[1].type       | addoutlet                                    |
      | data[1].sequence   | randomInt                                    |
      | data[1].user_id    | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[1].compulsory | randomAsciiCharacters                        |
      | data[1].is_active  | randomAsciiCharacters                        |
      | data[1].status     | randomAsciiCharacters                        |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath              | Value      |
      | Result             | false      |
      | Reason.1[0].Column | compulsory |
      | Reason.1[1].Column | is_active  |
      | Reason.1[2].Column | status     |
      | Reason.2[0].Column | compulsory |
      | Reason.2[1].Column | is_active  |
      | Reason.2[2].Column | status     |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest45
  Scenario: AppTabSequenceMDM:AppTabSequenceTest45 - InValid values into compulsory field,status field -non boolean values
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath              | Value                                        |
      | data[0].screen     | main                                         |
      | data[0].type       | outletlist                                   |
      | data[0].sequence   | randomInt                                    |
      | data[0].user_id    | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[0].compulsory | randomInt                                    |
      | data[0].is_active  | randomInt                                    |
      | data[0].status     | randomInt                                    |
      | data[1].screen     | main                                         |
      | data[1].type       | addoutlet                                    |
      | data[1].sequence   | randomInt                                    |
      | data[1].user_id    | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[1].compulsory | randomDouble                                 |
      | data[1].is_active  | randomDouble                                 |
      | data[1].status     | randomDouble                                 |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath              | Value      |
      | Result             | false      |
      | Reason.1[0].Column | compulsory |
      | Reason.1[1].Column | is_active  |
      | Reason.1[2].Column | status     |
      | Reason.2[0].Column | compulsory |
      | Reason.2[1].Column | is_active  |
      | Reason.2[2].Column | status     |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest46
  Scenario: AppTabSequenceMDM:AppTabSequenceTest46 - Verify the functionality by passing the valid sequence value
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath              | Value                                        |
      | data[0].screen     | main                                         |
      | data[0].type       | outletlist                                   |
      | data[0].sequence   | randomInt                                    |
      | data[0].user_id    | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[0].compulsory | 1                                            |
      | data[0].is_active  | 1                                            |
      | data[0].status     | 1                                            |
      | data[1].screen     | main                                         |
      | data[1].type       | addoutlet                                    |
      | data[1].sequence   | randomInt                                    |
      | data[1].user_id    | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[1].compulsory | 1                                            |
      | data[1].is_active  | 1                                            |
      | data[1].status     | 1                                            |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And I verify the data got updated as needed from DB
      | expectedColumn                                                            | expectedValue |
      | DB:apptabsequences:screen: id=(SELECT MAX(id)-1 FROM apptabsequences)     | main          |
      | DB:apptabsequences:type: id=(SELECT MAX(id)-1 FROM apptabsequences)       | outletlist    |
      | DB:apptabsequences:user_id: id=(SELECT MAX(id)-1 FROM apptabsequences)    | randomString  |
      | DB:apptabsequences:type: id=(SELECT MAX(id)-1 FROM apptabsequences)       | randomString  |
      | DB:apptabsequences:compulsory: id=(SELECT MAX(id)-1 FROM apptabsequences) | true          |
      | DB:apptabsequences:is_active: id=(SELECT MAX(id)-1 FROM apptabsequences)  | true          |
      | DB:apptabsequences:status: id=(SELECT MAX(id)-1 FROM apptabsequences)     | 1             |
      | DB:apptabsequences:screen: id=(SELECT MAX(id) FROM apptabsequences)       | main          |
      | DB:apptabsequences:type: id=(SELECT MAX(id) FROM apptabsequences)         | addoutlet     |
      | DB:apptabsequences:user_id: id=(SELECT MAX(id) FROM apptabsequences)      | randomString  |
      | DB:apptabsequences:type: id=(SELECT MAX(id) FROM apptabsequences)         | randomString  |
      | DB:apptabsequences:compulsory: id=(SELECT MAX(id) FROM apptabsequences)   | true          |
      | DB:apptabsequences:is_active: id=(SELECT MAX(id) FROM apptabsequences)    | true          |
      | DB:apptabsequences:status: id=(SELECT MAX(id) FROM apptabsequences)       | 1             |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest47  @AppTabSequenceTestBugFix
  Scenario: AppTabSequenceMDM:AppTabSequenceTest47 - Verify the functionality by passing the invalid sequence value
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath              | Value                                        |
      | data[0].screen     | main                                         |
      | data[0].type       | outletlist                                   |
      | data[0].sequence   | randomDouble                                 |
      | data[0].user_id    | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[0].compulsory | 1                                            |
      | data[0].is_active  | 1                                            |
      | data[0].status     | 1                                            |
      | data[1].screen     | main                                         |
      | data[1].type       | addoutlet                                    |
      | data[1].sequence   | 1.1                                          |
      | data[1].user_id    | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[1].compulsory | 1                                            |
      | data[1].is_active  | 1                                            |
      | data[1].status     | 1                                            |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath              | Value    |
      | Result             | false    |
      | Reason.1[0].Column | sequence |
      | Reason.2[0].Column | sequence |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest48
  Scenario: AppTabSequenceMDM:AppTabSequenceTest48 - Verify the functionality by passing the invalid sequence value-negative values
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath              | Value                                        |
      | data[0].screen     | main                                         |
      | data[0].type       | outletlist                                   |
      | data[0].sequence   | -10                                          |
      | data[0].user_id    | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[0].compulsory | 1                                            |
      | data[0].is_active  | 1                                            |
      | data[0].status     | 1                                            |
      | data[1].screen     | main                                         |
      | data[1].type       | addoutlet                                    |
      | data[1].sequence   | 0                                            |
      | data[1].user_id    | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[1].compulsory | 1                                            |
      | data[1].is_active  | 1                                            |
      | data[1].status     | 1                                            |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath              | Value    |
      | Result             | false    |
      | Reason.1[0].Column | sequence |
      | Reason.2[0].Column | sequence |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest49
  Scenario: AppTabSequenceMDM:AppTabSequenceTest49 - Verify the functionality by passing the invalid sequence value-negative values
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath              | Value                                        |
      | data[0].screen     | main                                         |
      | data[0].type       | outletlist                                   |
      | data[0].sequence   | randomString                                 |
      | data[0].user_id    | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[0].compulsory | 1                                            |
      | data[0].is_active  | 1                                            |
      | data[0].status     | 1                                            |
      | data[1].screen     | main                                         |
      | data[1].type       | addoutlet                                    |
      | data[1].sequence   | randomAsciiCharacters                        |
      | data[1].user_id    | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[1].compulsory | 1                                            |
      | data[1].is_active  | 1                                            |
      | data[1].status     | 1                                            |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath              | Value    |
      | Result             | false    |
      | Reason.1[0].Column | sequence |
      | Reason.2[0].Column | sequence |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest50
  Scenario: AppTabSequenceMDM:AppTabSequenceTest50 - Invalid combination of screen and type column value-Error should be thrown
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath            | Value                                        |
      | data[0].screen   | main                                         |
      | data[0].type     | schemes                                      |
      | data[0].sequence | randomInt                                    |
      | data[0].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[1].screen   | outlet_call                                  |
      | data[1].type     | outletlist                                   |
      | data[1].sequence | randomInt                                    |
      | data[1].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath              | Value |
      | Result             | false |
      | Reason.1[0].Column | type  |
      | Reason.2[0].Column | type  |

    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest51
  Scenario: AppTabSequenceMDM:AppTabSequenceTest51 - Invalid combination of screen and type column value-Error should be thrown
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath            | Value                                        |
      | data[0].screen   | outlet_info                                  |
      | data[0].type     | Sale                                         |
      | data[0].sequence | randomInt                                    |
      | data[0].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[1].screen   | order_fulfillment                            |
      | data[1].type     | outletlist                                   |
      | data[1].sequence | randomInt                                    |
      | data[1].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath              | Value |
      | Result             | false |
      | Reason.1[0].Column | type  |
      | Reason.2[0].Column | type  |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest52
  Scenario: AppTabSequenceMDM:AppTabSequenceTest52 - Invalid combination of screen and type column value-Error should be thrown
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath            | Value                                        |
      | data[0].screen   | warehouse_info                               |
      | data[0].type     | Sale                                         |
      | data[0].sequence | randomInt                                    |
      | data[0].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
      | data[1].screen   | tertiary_sale                                |
      | data[1].type     | outletlist                                   |
      | data[1].sequence | randomInt                                    |
      | data[1].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1 |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath              | Value |
      | Result             | false |
      | Reason.1[0].Column | type  |
      | Reason.2[0].Column | type  |
    And verify response time is less than "3000" milliseconds

  @AppTabSequenceTest53   @AppTabSequenceTestBugFix
  Scenario: AppTabSequenceMDM:AppTabSequenceTest53 - Mandatory fields
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName   | HeaderValue                        |
      | Cookie       | CAKEPHP=7hq5i4p4kv86rfgpr032urssod |
      | Content-Type | application/json                   |
    And I modify fields with random values and remove fields in "insertMdmData_apptabsequence_MDM" payload
      | JPath            | Value                                                    |
      | data[0].screen   | DB:apptabsequences:screen:is_active=0  AND user_id !=0   |
      | data[0].type     | DB:apptabsequences:type:is_active=0   AND user_id !=0    |
      | data[0].sequence | randomInt                                                |
      | data[0].user_id  | DB:apptabsequences:user_id:is_active=0   AND user_id !=0 |
      | data[1].screen   | main                                                     |
      | data[1].type     | outletlist                                               |
      | data[1].sequence | randomInt                                                |
      | data[1].user_id  | DB:users:id:active=1 ORDER BY RAND() LIMIT 1             |
    When I post the request with "insertMdmData_apptabsequence_MDM" payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | ACCESS_TOKEN |
      | responsetype | json         |
    And the fields in response should match with expected values
      | JPath    | Value                      |
      | Result   | true                       |
      | Reason.1 | Data Uploaded Successfully |
      | Reason.2 | Data Uploaded Successfully |
    And verify response time is less than "3000" milliseconds


