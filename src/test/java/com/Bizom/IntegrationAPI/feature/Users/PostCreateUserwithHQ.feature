@CreateUsers  @Sanity @All   @PR1-T10647
@Execution @allPost
Feature: Post Create Users API – postCreateUserwithHQ

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      | HeaderName      | HeaderValue              |
      | Accept          | */*                      |
      | Accept-Encoding | gzip,deflate, br         |
      | Connection      | keep-alive               |
      | Content-Type    | application/xml          |

  Scenario: TC_01 Create Users – Positive case (New user creation)
    And I modify fields with random values and remove fields in "postCreateUserwithHQ" XML payload
      | XPath           | Value     |
      | User/username   | randomStr |
      | User/employeeid | random    |
    And I post the request with "postCreateUserwithHQ" xml payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | Access_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath  | Value                      |
      | Result | "true"                     |
      | Reason | "User added successfully." |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_02 Create Users – HQ Name EXIST, HQ ERP ID EXIST, Not Linked
    And I modify fields with random values and remove fields in "postCreateUserwithHQ" XML payload
      | XPath        | Value  |
      | User/hqName  | HQ1    |
      | User/hqErpId | HQERP2 |
    And I post the request with "postCreateUserwithHQ" xml payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | Access_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath  | Value                                             |
      | Result | "false"                                           |
      | Reason | "Please provide valid headquarter name and erp_id" |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_03 Create Users – HQ Name EXIST, HQ ERP ID NOT EXIST
    And I modify fields with random values and remove fields in "postCreateUserwithHQ" XML payload
      | XPath        | Value        |
      | User/hqName  | HQ1          |
      | User/hqErpId | notexistyhyy |
    And I post the request with "postCreateUserwithHQ" xml payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | Access_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath  | Value                                             |
      | Result | "false"                                           |
      | Reason | "Please provide valid headquarter name and erp_id" |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_04 Create Users – HQ Name NOT EXIST, HQ ERP ID EXIST
    And I modify fields with random values and remove fields in "postCreateUserwithHQ" XML payload
      | XPath        | Value        |
      | User/hqName  | notexistyhyy |
      | User/hqErpId | HQERP1      |
    And I post the request with "postCreateUserwithHQ" xml payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | Access_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath  | Value                                             |
      | Result | "false"                                           |
      | Reason | "Please provide valid headquarter name and erp_id" |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_05 Create Users – HQ Name EMPTY, HQ ERP ID NOT EXIST
    And I modify fields with random values and remove fields in "postCreateUserwithHQ" XML payload
      | XPath        | Value        |
      | User/hqName  |              |
      | User/hqErpId | notexisterp |
    And I post the request with "postCreateUserwithHQ" xml payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | Access_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath  | Value                           |
      | Result | "false"                         |
      | Reason | "Please provide valid hq erpid" |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_06 Create Users – HQ Name EMPTY, HQ ERP ID EXIST, User Exists
    And I modify fields with random values and remove fields in "postCreateUserwithHQ" XML payload
      | XPath        | Value       |
      | User/hqName  |             |
      | User/hqErpId | existerpid |
    And I post the request with "postCreateUserwithHQ" xml payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | Access_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath  | Value                        |
      | Result | "true"                       |
      | Reason | "User updated successfully" |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_07 Create Users – HQ Name EMPTY, HQ ERP ID EXIST, User NOT Exist
    And I modify fields with random values and remove fields in "postCreateUserwithHQ" XML payload
      | XPath           | Value     |
      | User/hqName     |           |
      | User/hqErpId    | existerpid |
      | User/username   | randomStr |
      | User/employeeid | random    |
    And I post the request with "postCreateUserwithHQ" xml payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | Access_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath  | Value                      |
      | Result | "true"                     |
      | Reason | "User added successfully." |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_08 Create Users – HQ Name NOT EXIST, HQ ERP ID EMPTY, User Exists
    And I modify fields with random values and remove fields in "postCreateUserwithHQ" XML payload
      | XPath        | Value     |
      | User/hqName  | randomStr |
      | User/hqErpId |           |
    And I post the request with "postCreateUserwithHQ" xml payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | Access_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath  | Value                        |
      | Result | "true"                       |
      | Reason | "User updated successfully" |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_09 Create Users – HQ Name NOT EXIST, HQ ERP ID EMPTY, User NOT Exist
    And I modify fields with random values and remove fields in "postCreateUserwithHQ" XML payload
      | XPath           | Value     |
      | User/hqName     | randomStr |
      | User/hqErpId    |           |
      | User/username   | randomStr |
      | User/employeeid | random    |
    And I post the request with "postCreateUserwithHQ" xml payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | Access_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath  | Value                      |
      | Result | "true"                     |
      | Reason | "User added successfully." |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_10 Create Users – HQ Name EMPTY, HQ ERP ID EMPTY, User Exists
    And I modify fields with random values and remove fields in "postCreateUserwithHQ" XML payload
      | XPath        | Value |
      | User/hqName  |       |
      | User/hqErpId |       |
    And I post the request with "postCreateUserwithHQ" xml payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | Access_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath  | Value                        |
      | Result | "true"                       |
      | Reason | "User updated successfully" |
    And verify response time is less than "2500" milliseconds


  Scenario: TC_11 Create Users – HQ Name EMPTY, HQ ERP ID EMPTY, User NOT Exist
    And I modify fields with random values and remove fields in "postCreateUserwithHQ" XML payload
      | XPath           | Value     |
      | User/hqName     |           |
      | User/hqErpId    |           |
      | User/username   | randomStr |
      | User/employeeid | random    |
    And I post the request with "postCreateUserwithHQ" xml payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | Access_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath  | Value                      |
      | Result | "true"                     |
      | Reason | "User added successfully." |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_12 Create Users – HQ Name EXIST, HQ ERP ID EXIST, Both Linked, User Exists
    And I modify fields with random values and remove fields in "postCreateUserwithHQ" XML payload
      | XPath           | Value      |
      | User/username   | nameexist |
      | User/employeeid | erpexist  |
    And I post the request with "postCreateUserwithHQ" xml payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | Access_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath  | Value                        |
      | Result | "true"                       |
      | Reason | "User updated successfully" |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_13 Create Users – HQ Name EXIST, HQ ERP ID EXIST, Both Linked, User NOT Exist
    And I modify fields with random values and remove fields in "postCreateUserwithHQ" XML payload
      | XPath           | Value      |
      | User/username   | randomStr |
      | User/employeeid | random    |
    And I post the request with "postCreateUserwithHQ" xml payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | Access_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath  | Value                      |
      | Result | "true"                     |
      | Reason | "User added successfully." |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_14 Create Users – HQ Name EXIST, HQ ERP ID EMPTY, User Exists
    And I modify fields with random values and remove fields in "postCreateUserwithHQ" XML payload
      | XPath           | Value      |
      | User/username   | newhqexist |
      | User/employeeid |           |
    And I post the request with "postCreateUserwithHQ" xml payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | Access_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath  | Value                        |
      | Result | "true"                       |
      | Reason | "User updated successfully" |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_15 Create Users – HQ Name EXIST, HQ ERP ID EMPTY, User NOT Exist
    And I modify fields with random values and remove fields in "postCreateUserwithHQ" XML payload
      | XPath           | Value     |
      | User/username   | randomStr |
      | User/employeeid | random    |
    And I post the request with "postCreateUserwithHQ" xml payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | Access_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath  | Value                      |
      | Result | "true"                     |
      | Reason | "User added successfully." |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_16 Create Users – HQ Name NOT EXIST, HQ ERP ID NOT EXIST, User Exists
    And I modify fields with random values and remove fields in "postCreateUserwithHQ" XML payload
      | XPath        | Value     |
      | User/hqName  | randomStr |
      | User/hqErpId | random    |
    And I post the request with "postCreateUserwithHQ" xml payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | Access_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath  | Value                        |
      | Result | "true"                       |
      | Reason | "User updated successfully" |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_17 Create Users – HQ Name NOT EXIST, HQ ERP ID NOT EXIST, User NOT Exist
    And I modify fields with random values and remove fields in "postCreateUserwithHQ" XML payload
      | XPath           | Value     |
      | User/hqName     | randomStr |
      | User/hqErpId    | random    |
      | User/username   | randomStr |
      | User/employeeid | random    |
    And I post the request with "postCreateUserwithHQ" xml payload with dynamic access token and query parameters
      | Query        | Value        |
      | access_token | Access_TOKEN |
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath  | Value                      |
      | Result | "true"                     |
      | Reason | "User added successfully." |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_18 Create Users – Negative Case – Without access token
    And I modify fields with random values and remove fields in "postCreateUserwithHQ" XML payload
      | XPath        | Value     |
      | User/hqName  | randomStr |
      | User/hqErpId | random    |
    And I post the request with "postCreateUserwithHQ" xml payload with dynamic access token and query parameters
      | Query | Value |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath                | Value                           |
      | $.error              | invalid_request                 |
      | $.error_description  | The access token was not found. |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_19 Create Users – Negative Case – Empty access token value
    And I modify fields with random values and remove fields in "postCreateUserwithHQ" XML payload
      | XPath        | Value     |
      | User/hqName  | randomStr |
      | User/hqErpId | random    |
    And I post the request with "postCreateUserwithHQ" xml payload with dynamic access token and query parameters
      | Query        | Value |
      | access_token |       |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath   | Value           |
      | $.error | invalid_request |
    And verify response time is less than "2500" milliseconds

  Scenario: TC_20 Create Users – Negative Case – Invalid access token
    And I modify fields with random values and remove fields in "postCreateUserwithHQ" XML payload
      | XPath        | Value     |
      | User/hqName  | randomStr |
      | User/hqErpId | random    |
    And I post the request with "postCreateUserwithHQ" xml payload with dynamic access token and query parameters
      | Query        | Value            |
      | access_token | invalidtokenhh  |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath   | Value         |
      | $.error | invalid_grant |
    And verify response time is less than "2500" milliseconds

  @hqmycase
  Scenario: TC_21 Create Users – Negative Case – Null access token
    And I modify fields with random values and remove fields in "postCreateUserwithHQ" XML payload
      | XPath        | Value     |
      | User/hqName  | randomStr |
      | User/hqErpId | random    |
    And I post the request with "postCreateUserwithHQ" xml payload with dynamic access token and query parameters
      | Query        | Value |
      | access_token | null  |
    Then I should see the response code as "401"
    And the fields in response should match with expected values
      | JPath   | Value         |
      | $.error | invalid_grant |
    And verify response time is less than "2500" milliseconds
