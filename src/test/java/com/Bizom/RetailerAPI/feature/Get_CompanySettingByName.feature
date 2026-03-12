@Retailer @CompanySettingByName @Sanity  @allGet
Feature: This feature file contains testcases for GET endpoint getCompanySettingByName

  @CompanySettingByNamePositive
  Scenario: TC_01 getCompanySettingByName - status code positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompanySettingByName" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|settingName| deliverytime|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath                    | Value |
      | $.Result                 | "true"  |
      | $.Reason                 | ""   |
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  |application/json; charset=UTF-8 |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "CompanySettingByName" name using full path

  @CompanySettingByNamePositive
  Scenario: TC_02 getCompanySettingByName - for setting deliverytime
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompanySettingByName" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|settingName| deliverytime|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath                    | Value |
      | $.Result                 | "true"  |
      | $.Reason                 | ""   |
      | $.Setting.deliverytime |false|
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  |application/json; charset=UTF-8 |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "CompanySettingByName" name using full path



  @CompanySettingByNamePositive
  Scenario: TC_03 getCompanySettingByName - for setting loyaltyPointsNew
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompanySettingByName" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|settingName| loyaltyPointsNew|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath                    | Value |
      | $.Result                 | "true"  |
      | $.Reason                 | ""   |
      | $.Setting.loyaltyPointsNew |false|
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  |application/json; charset=UTF-8|
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "CompanySettingByName" name using full path


  @CompanySettingByNamePositive
  Scenario: TC_04 getCompanySettingByName - for setting checkforuniqueoutletmobilenumber
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompanySettingByName" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|settingName| checkforuniqueoutletmobilenumber|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath                    | Value |
      | $.Result                 | "true"  |
      | $.Reason                 | ""   |
      | $.Setting.checkforuniqueoutletmobilenumber |false|
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  |application/json; charset=UTF-8|
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And I store the response as "CompanySettingByName" name using full path

  @CompanySettingByNamePositive
  Scenario: TC_05 getCompanySettingByName - for setting filters
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompanySettingByName" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|settingName| filters|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath                    | Value |
      | $.Result                 | "true"  |
      | $.Reason                 | ""   |
      | $.Setting.filters |"BRAND,CATEGORY,SUBCATEGORY,VARIANT"|
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  |application/json; charset=UTF-8|
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And I store the response as "CompanySettingByName" name using full path

  @CompanySettingByNamePositive
  Scenario: TC_06 getCompanySettingByName - for setting salereturnRetailer
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompanySettingByName" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|settingName| salereturnRetailer|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath                    | Value |
      | $.Result                 | "true"  |
      | $.Reason                 | ""   |
      | $.Setting.salereturnRetailer |true|
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  |application/json; charset=UTF-8|
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "CompanySettingByName" name using full path


  @CompanySettingByNamePositive
  Scenario: TC_07 getCompanySettingByName - for setting cashback
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompanySettingByName" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|settingName| cashback|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath                    | Value |
      | $.Result                 | "true"  |
      | $.Reason                 | ""   |
      | $.Setting.cashback |true|
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  |application/json; charset=UTF-8 |
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "CompanySettingByName" name using full path


  @CompanySettingByNamePositive
  Scenario: TC_08 getCompanySettingByName - for setting contactsupportRetailerapp
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompanySettingByName" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|settingName| contactsupportRetailerapp|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath                    | Value |
      | $.Result                 | "true"  |
      | $.Reason                 | ""   |
      | $.Setting.contactsupportRetailerapp |false|
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  |application/json; charset=UTF-8|
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "CompanySettingByName" name using full path

  @CompanySettingByNamePositive
  Scenario: TC_09 getCompanySettingByName - for setting showgstintransaction
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompanySettingByName" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|settingName| showgstintransaction|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath                    | Value |
      | $.Result                 | "true"  |
      | $.Reason                 | ""   |
      | $.Setting.showgstintransaction |true|
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  |application/json; charset=UTF-8|
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "CompanySettingByName" name using full path

  @CompanySettingByNamePositive
  Scenario: TC_10 getCompanySettingByName - for setting enableSkuvisibility
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompanySettingByName" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|settingName| enableSkuvisibility|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath                    | Value |
      | $.Result                 | "true"  |
      | $.Reason                 | ""   |
      | $.Setting.enableSkuvisibility |false|
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  |application/json; charset=UTF-8|
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "CompanySettingByName" name using full path

  @CompanySettingByNamePositive
  Scenario: TC_11 getCompanySettingByName - for setting markfulfillment
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompanySettingByName" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|settingName| markfulfillment|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath                    | Value |
      | $.Result                 | "true"  |
      | $.Reason                 | ""   |
      | $.Setting.markfulfillment |false|
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  | application/json; charset=UTF-8|
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "CompanySettingByName" name using full path

  @CompanySettingByNamePositive
  Scenario: TC_12 getCompanySettingByName - multiple setting name passed
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
    And I send the GET request to "getCompanySettingByName" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|settingName| deliverytime,loyaltyPointsNew,checkforuniqueoutletmobilenumber,filters,salereturnRetailer,cashback,contactsupportRetailerapp,showgstintransaction,enableSkuvisibility,markfulfillment|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      | JPath                    | Value |
      | $.Result                 | "true"  |
      | $.Reason                 | ""   |
      | $.Setting.cashback | true|
      | $.Setting.checkforuniqueoutletmobilenumber | false|
      | $.Setting.contactsupportRetailerapp | false|
      | $.Setting.deliverytime | false|
      | $.Setting.enableSkuvisibility | false|
      | $.Setting.filters |"BRAND,CATEGORY,SUBCATEGORY,VARIANT"|
      | $.Setting.loyaltyPointsNew | false|
      | $.Setting.markfulfillment | false|
      | $.Setting.salereturnRetailer | true|
      | $.Setting.showgstintransaction | true|
    And verify response headers
      | HeaderName    | HeaderValue                 |
      | Content-Type  |application/json; charset=UTF-8|
      | Server        | Bizom                       |
      | Connection    | keep-alive                  |
    And verify response time is less than "1200" milliseconds
    And I store the response as "CompanySettingByName" name using full path