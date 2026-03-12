@BizomWebAPI @PI @DiscountCategoriesManagement @DiscountCategories @DiscountCategoryEditSkus @IntegrationServices
Feature: Discount category edit SKU matrix validation
  As a Bizom Web API tester
  I want to validate the DiscountCategories edit SKU data endpoint
  So that discount category edits always display accurate SKU level constraints

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Access discount category edit SKUs without access token
    When I send the GET request to "discount_categories_edit" endpoint with path parameters
      |Path|Value|
      |discountCategoryId|1|
      |parentCategoryId|0|
      |channelId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Access discount category edit SKUs with invalid access token
    And I send the GET request to "discount_categories_edit" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|discountCategoryId|1|
      |||parentCategoryId|0|
      |||channelId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Access discount category edit SKUs with expired access token
    And I send the GET request to "discount_categories_edit" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|discountCategoryId|1|
      |||parentCategoryId|0|
      |||channelId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: Access discount category edit SKUs with malformed access token
    And I send the GET request to "discount_categories_edit" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|malformed.token.here|discountCategoryId|1|
      |||parentCategoryId|0|
      |||channelId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: Retrieve discount category edit SKU matrix successfully
    And I send the GET request to "discount_categories_edit" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountCategoryId|1|
      |||parentCategoryId|0|
      |||channelId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|
      |$.Reason|""|
      |$.skudata[0].skudata.name|DB:skunits:name: id=1|
    And I store the response as "discount_categories_edit_response" name using full path

  @Positive @DataValidation
  Scenario: Validate beverage SKUs returned for edit workflow
    And I send the GET request to "discount_categories_edit" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountCategoryId|1|
      |||parentCategoryId|0|
      |||channelId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.skudata[0].skudata.name|DB:skunits:name: id=1|
      |$.skudata[0].skudata.code|DB:skunits:skucode: id=1|
      |$.skudata[1].skudata.name|DB:skunits:name: id=2|
      |$.skudata[1].skudata.code|DB:skunits:skucode: id=2|
      |$.skudata[2].skudata.name|DB:skunits:name: id=3|
      |$.skudata[2].skudata.code|DB:skunits:skucode: id=3|

  @Positive @DataValidation
  Scenario: Validate snack SKUs within edit matrix
    And I send the GET request to "discount_categories_edit" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountCategoryId|1|
      |||parentCategoryId|0|
      |||channelId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.skudata[3].skudata.name|DB:skunits:name: id=4|
      |$.skudata[4].skudata.name|DB:skunits:name: id=5|
      |$.skudata[5].skudata.name|DB:skunits:name: id=6|

  @Positive @Structure
  Scenario: Validate discount category edit response data types
    And I send the GET request to "discount_categories_edit" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountCategoryId|1|
      |||parentCategoryId|0|
      |||channelId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.skudata|array|
      |$.skudata[0]|object|
      |$.skudata[0].skudata|object|
      |$.skudata[0].skudata.name|string|
      |$.skudata[0].skudata.mrp|string|
      |$.skudata[0].skudata.discount|string|

  @Positive @Structure
  Scenario: Validate required keys are present in the edit response
    And I send the GET request to "discount_categories_edit" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountCategoryId|1|
      |||parentCategoryId|0|
      |||channelId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |skudata|
      |skunit_id|
      |name|
      |code|
      |discount|
      |mindiscount|
      |maxdiscount|

  @Positive @Structure
  Scenario: Validate non-null critical fields in the edit payload
    And I send the GET request to "discount_categories_edit" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountCategoryId|1|
      |||parentCategoryId|0|
      |||channelId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verifies the field is not null
      |JPath|
      |$.skudata[0].skudata.skunit_id|
      |$.skudata[0].skudata.name|
      |$.skudata[0].skudata.mrp|
      |$.skudata[0].skudata.price|
      |$.skudata[0].skudata.maxdiscount|

  @Positive @ArrayValidation
  Scenario: Validate SKU list excludes invalid placeholders
    And I send the GET request to "discount_categories_edit" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountCategoryId|1|
      |||parentCategoryId|0|
      |||channelId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verifies the list does not contain the values
      |JPath|Value|
      |$.skudata[*].skudata.name|DeletedSKU;ArchivedSKU|

  @Positive @BusinessLogic
  Scenario: Cross check critical SKUs against database master data
    And I send the GET request to "discount_categories_edit" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountCategoryId|1|
      |||parentCategoryId|0|
      |||channelId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.skudata[0].skudata.name|DB:skunits:name: id=1|
      |$.skudata[2].skudata.name|DB:skunits:name: id=3|
      |$.skudata[3].skudata.name|DB:skunits:name: id=4|
      |$.skudata[4].skudata.name|DB:skunits:name: id=5|

  @Positive @Performance
  Scenario: Validate discount category edit API responsiveness
    And I send the GET request to "discount_categories_edit" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountCategoryId|1|
      |||parentCategoryId|0|
      |||channelId|1|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|
      |$.skudata[0].skudata.name|DB:skunits:name: id=1|

  @Positive @CacheControl
  Scenario: Validate edit SKU retrieval with cache busting parameter
    And I send the GET request to "discount_categories_edit" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountCategoryId|1|
      |_|1764235379015|||
      |||parentCategoryId|0|
      |||channelId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|
      |$.skudata[0].skudata.name|DB:skunits:name: id=1|
      |$.skudata[26].skudata.name|DB:skunits:name: id=801|

  @Positive @Monitoring
  Scenario: Validate successful operation indicators for edit SKU API
    And I send the GET request to "discount_categories_edit" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|discountCategoryId|1|
      |||parentCategoryId|0|
      |||channelId|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I validate that the operation was successfully completed in the system
    And I verify API response at path with DB and static values
      |JPath|Value|
      |$.Result|true|
      |$.skudata[5].skudata.name|DB:skunits:name: id=6|


