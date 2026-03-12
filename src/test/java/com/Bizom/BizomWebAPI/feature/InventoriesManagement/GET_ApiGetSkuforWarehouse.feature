@BizomWebAPI @OS @InventoriesManagement @ApiGetSkuforWarehouse @DataProcessing
Feature: API Get SKU for Warehouse API Testing
  As a system user
  I want to test the API get SKU for warehouse endpoint
  So that I can ensure proper functionality and data retrieval for SKU warehouse inventory

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get SKU for warehouse without access token
    When I send the GET request to "inventories_apigetskuforwarehouse" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_02 Get SKU for warehouse with invalid access token
#    And I send the GET request to "inventories_apigetskuforwarehouse" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|invalid_token_12345|
#      |startseq|1|
#      |endseq|1|
#      |date|2025-10-06|
#      |responsetype|json|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds
#
#  @Negative @Security
#  Scenario: TC_03 Get SKU for warehouse with expired access token
#    And I send the GET request to "inventories_apigetskuforwarehouse" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|expired_token_12345|
#      |startseq|1|
#      |endseq|1|
#      |date|2025-10-06|
#      |responsetype|json|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

#  @Negative @Security
#  Scenario: TC_04 Get SKU for warehouse with malformed access token
#    And I send the GET request to "inventories_apigetskuforwarehouse" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|malformed.token.here|
#      |startseq|1|
#      |endseq|1|
#      |date|2025-10-06|
#      |responsetype|json|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get SKU for warehouse with valid access token
    And I send the GET request to "inventories_apigetskuforwarehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startseq|1|
      |endseq|1|
      |date|2025-10-06|
      |responsetype|json|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
    And I store the response as "sku_for_warehouse_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate SKU for warehouse response structure
    And I send the GET request to "inventories_apigetskuforwarehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startseq|1|
      |endseq|1|
      |date|2025-10-06|
      |responsetype|json|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response.Result|string|
      |$.Response.Reason|string|
      |$.Response.Products|array|

  @Positive @DataValidation
  Scenario: TC_07 Validate Products array structure
    And I send the GET request to "inventories_apigetskuforwarehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startseq|1|
      |endseq|1|
      |date|2025-10-06|
      |responsetype|json|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response.Products|array|
      |$.Response.Products[0]|object|
      |$.Response.Products[0].Skunit|object|
      |$.Response.Products[0].Brand|object|
      |$.Response.Products[0].Variant|object|
      |$.Response.Products[0].Packaging|object|
      |$.Response.Products[0].Category|object|
      |$.Response.Products[0].Subcategory|object|

  @Positive @DataValidation
  Scenario: TC_08 Validate Skunit object structure
    And I send the GET request to "inventories_apigetskuforwarehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startseq|1|
      |endseq|1|
      |date|2025-10-06|
      |responsetype|json|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response.Products[0].Skunit.id|string|
      |$.Response.Products[0].Skunit.name|string|
      |$.Response.Products[0].Skunit.mrp|string|
      |$.Response.Products[0].Skunit.vat|string|
      |$.Response.Products[0].Skunit.price|string|
      |$.Response.Products[0].Skunit.active|string|
      |$.Response.Products[0].Skunit.company_id|string|
      |$.Response.Products[0].Skunit.created|string|
      |$.Response.Products[0].Skunit.modified|string|
      |$.Response.Products[0].Skunit.currency|string|
      |$.Response.Products[0].Skunit.warehouse_id|string|
      |$.Response.Products[0].Skunit.warehouse_name|string|

  @Positive @DataValidation
  Scenario: TC_09 Validate Brand object structure
    And I send the GET request to "inventories_apigetskuforwarehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startseq|1|
      |endseq|1|
      |date|2025-10-06|
      |responsetype|json|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response.Products[0].Brand|object|
      |$.Response.Products[0].Brand.id|string|
      |$.Response.Products[0].Brand.name|string|

  @Positive @DataValidation
  Scenario: TC_10 Validate Category and Subcategory object structure
    And I send the GET request to "inventories_apigetskuforwarehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startseq|1|
      |endseq|1|
      |date|2025-10-06|
      |responsetype|json|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response.Products[0].Category|object|
      |$.Response.Products[0].Category.id|string|
      |$.Response.Products[0].Category.name|string|
      |$.Response.Products[0].Subcategory|object|
      |$.Response.Products[0].Subcategory.id|string|
      |$.Response.Products[0].Subcategory.name|string|

  @Positive @Performance
  Scenario: TC_11 Performance test for SKU for warehouse endpoint
    And I send the GET request to "inventories_apigetskuforwarehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startseq|1|
      |endseq|1|
      |date|2025-10-06|
      |responsetype|json|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|

  @Positive @Concurrency
  Scenario: TC_12 Concurrent access test for SKU for warehouse endpoint
    And I send the GET request to "inventories_apigetskuforwarehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startseq|1|
      |endseq|1|
      |date|2025-10-06|
      |responsetype|json|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|

  @Negative @Validation
  Scenario: TC_13 Get SKU for warehouse with missing query parameters
    And I send the GET request to "inventories_apigetskuforwarehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startseq|1|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_14 Get SKU for warehouse with invalid date format
    And I send the GET request to "inventories_apigetskuforwarehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startseq|1|
      |endseq|1|
      |date|invalid-date-format|
      |responsetype|json|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_15 Get SKU for warehouse with invalid responsetype
    And I send the GET request to "inventories_apigetskuforwarehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startseq|1|
      |endseq|1|
      |date|2025-10-06|
      |responsetype|invalid_type|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation
  Scenario: TC_16 Get SKU for warehouse with invalid sequence numbers
    And I send the GET request to "inventories_apigetskuforwarehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startseq|-1|
      |endseq|0|
      |date|2025-10-06|
      |responsetype|json|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_17 Get SKU for warehouse with SQL injection attempt
    And I send the GET request to "inventories_apigetskuforwarehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startseq|1|
      |endseq|1|
      |date|'; DROP TABLE inventories; --|
      |responsetype|json|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

#  @Negative @ErrorHandling
#  Scenario: TC_18 Get SKU for warehouse with invalid endpoint
#    And I send the GET request to "inventories_apigetskuforwarehouse_invalid" endpoint with dynamic access token and query parameters
#      |QueryParamName|QueryParamValue|
#      |access_token|ACCESS_TOKEN|
#      |startseq|1|
#      |endseq|1|
#      |date|2025-10-06|
#      |responsetype|json|
#    Then I should see the response code as "200"
#    And the HTML response should contain page title "Users"
#    And verify response time is less than "2500" milliseconds

  @Positive @BusinessLogic
  Scenario: TC_19 Validate SKU for warehouse business logic
    And I send the GET request to "inventories_apigetskuforwarehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startseq|1|
      |endseq|1|
      |date|2025-10-06|
      |responsetype|json|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response.Result|string|
      |$.Response.Reason|string|
      |$.Response.Products|array|
      |$.Response.Products[0].Skunit|object|
      |$.Response.Products[0].Brand|object|

  @Positive @DataIntegrity
  Scenario: TC_20 Validate SKU for warehouse data integrity
    And I send the GET request to "inventories_apigetskuforwarehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startseq|1|
      |endseq|1|
      |date|2025-10-06|
      |responsetype|json|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response.Result|string|
      |$.Response.Reason|string|
      |$.Response.Products|array|
      |$.Response.Products[0].Skunit.id|string|
      |$.Response.Products[0].Skunit.name|string|
      |$.Response.Products[0].Brand.id|string|
      |$.Response.Products[0].Brand.name|string|

  @Positive @Regression
  Scenario: TC_21 Regression test for SKU for warehouse endpoint
    And I send the GET request to "inventories_apigetskuforwarehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startseq|1|
      |endseq|1|
      |date|2025-10-06|
      |responsetype|json|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response.Result|string|
      |$.Response.Reason|string|
      |$.Response.Products|array|
      |$.Response.Products[0].Skunit|object|
      |$.Response.Products[0].Brand|object|
      |$.Response.Products[0].Category|object|
      |$.Response.Products[0].Subcategory|object|

  @Positive @Functional
  Scenario: TC_22 Validate SKU for warehouse response completeness
    And I send the GET request to "inventories_apigetskuforwarehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startseq|1|
      |endseq|1|
      |date|2025-10-06|
      |responsetype|json|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response.Result|string|
      |$.Response.Reason|string|
      |$.Response.Products|array|
      |$.Response.Products[0].Skunit.id|string|
      |$.Response.Products[0].Skunit.name|string|
      |$.Response.Products[0].Skunit.mrp|string|
      |$.Response.Products[0].Skunit.price|string|
      |$.Response.Products[0].Brand.id|string|
      |$.Response.Products[0].Brand.name|string|
      |$.Response.Products[0].Category.id|string|
      |$.Response.Products[0].Category.name|string|

  @Positive @ArrayValidation
  Scenario: TC_23 Validate Products array structure and content
    And I send the GET request to "inventories_apigetskuforwarehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startseq|1|
      |endseq|1|
      |date|2025-10-06|
      |responsetype|json|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response.Products|array|
      |$.Response.Products[0]|object|
      |$.Response.Products[0].Skunit|object|
      |$.Response.Products[0].Brand|object|
      |$.Response.Products[0].Variant|object|
      |$.Response.Products[0].Packaging|object|
      |$.Response.Products[0].Category|object|
      |$.Response.Products[0].Subcategory|object|

  @Positive @ContentValidation
  Scenario: TC_24 Validate SKU for warehouse content structure
    And I send the GET request to "inventories_apigetskuforwarehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startseq|1|
      |endseq|1|
      |date|2025-10-06|
      |responsetype|json|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
    And validating the response contains the following values
      |Value|
      |Response|
      |Result|
      |Reason|
      |Products|
      |Skunit|
      |Brand|
      |Variant|
      |Packaging|
      |Category|
      |Subcategory|

  @Positive @LoadTesting
  Scenario: TC_25 Load testing for SKU for warehouse endpoint
    And I send the GET request to "inventories_apigetskuforwarehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startseq|1|
      |endseq|1|
      |date|2025-10-06|
      |responsetype|json|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|

  @Negative @Timeout
  Scenario: TC_26 Test SKU for warehouse endpoint timeout handling
    And I send the GET request to "inventories_apigetskuforwarehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startseq|1|
      |endseq|1|
      |date|2025-10-06|
      |responsetype|json|
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|

  @Positive @EndToEnd
  Scenario: TC_27 End-to-end SKU for warehouse data retrieval workflow
    And I send the GET request to "inventories_apigetskuforwarehouse" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |startseq|1|
      |endseq|1|
      |date|2025-10-06|
      |responsetype|json|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Response.Result|"true"|
      |$.Response.Reason|""|
    And I store the response as "sku_for_warehouse_response" name using full path
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Response.Result|string|
      |$.Response.Reason|string|
      |$.Response.Products|array|
      |$.Response.Products[0]|object|
      |$.Response.Products[0].Skunit|object|
      |$.Response.Products[0].Skunit.id|string|
      |$.Response.Products[0].Skunit.name|string|
      |$.Response.Products[0].Skunit.mrp|string|
      |$.Response.Products[0].Skunit.price|string|
      |$.Response.Products[0].Brand|object|
      |$.Response.Products[0].Brand.id|string|
      |$.Response.Products[0].Brand.name|string|
      |$.Response.Products[0].Category|object|
      |$.Response.Products[0].Category.id|string|
      |$.Response.Products[0].Category.name|string|
      |$.Response.Products[0].Subcategory|object|
      |$.Response.Products[0].Subcategory.id|string|
      |$.Response.Products[0].Subcategory.name|string|

