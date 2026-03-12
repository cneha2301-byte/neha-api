@BizomWebAPI @SkuUnitsManagement @GetSkunitsList @ProductManagement @OS
Feature: Get SKU Units List API Testing
  As a system user
  I want to test the get SKU units list endpoint
  So that I can ensure proper functionality and data retrieval for SKU units list

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: Get SKU units list without access token
    When I send the GET request to "skunits_get_skunits_list" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |warehouseId|2|
      |skus||
      |outletId|5|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get SKU units list with invalid access token
#    And I send the GET request to "skunits_get_skunits_list" endpoint with dynamic access token and query parameters
#      |Query         |Value         |
#      |access_token  |invalid_token_12345|
#      |warehouseId|2|
#      |skus||
#      |outletId|5|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get SKU units list with expired access token
#    And I send the GET request to "skunits_get_skunits_list" endpoint with dynamic access token and query parameters
#      |Query         |Value         |
#      |access_token  |expired_token_12345|
#      |warehouseId|2|
#      |skus||
#      |outletId|5|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

#  @Negative @Security
#  Scenario: Get SKU units list with malformed access token
#    And I send the GET request to "skunits_get_skunits_list" endpoint with dynamic access token and query parameters
#      |Query         |Value         |
#      |access_token  |malformed.token.here|
#      |warehouseId|2|
#      |skus||
#      |outletId|5|
#    Then I should see the response code as "200"
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.result|false|
#      |$.error.code|401|
#      |$.error.message|Invalid Access Token or Credentials|
#    And verify response time is less than "2000" milliseconds

#  @Positive @Smoke
#  Scenario: Get SKU units list with valid access token for warehouse ID 2 and outlet ID 5
#    And I send the GET request to "skunits_get_skunits_list" endpoint with dynamic access token and query parameters
#      |Query         |Value         |
#      |access_token  |ACCESS_TOKEN  |
#      |warehouseId|2|
#      |skus||
#      |outletId|5|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"Skunits found"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|array|
#      |$.data[0]|object|
#      |$.data[0].Inventory|object|
#      |$.data[0].Batch|object|
#      |$.data[0].Skunit|object|
#      |$.defaultprice|object|

#  @Positive @Functional
#  Scenario: Get SKU units list with different warehouse ID
#    And I send the GET request to "skunits_get_skunits_list" endpoint with dynamic access token and query parameters
#      |Query         |Value         |
#      |access_token  |ACCESS_TOKEN  |
#      |warehouseId|1|
#      |skus||
#      |outletId|2|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|array|
#      |$.defaultprice|object|

#  @Positive @Functional
#  Scenario: Get SKU units list with specific SKU filter
#    And I send the GET request to "skunits_get_skunits_list" endpoint with dynamic access token and query parameters
#      |Query         |Value         |
#      |access_token  |ACCESS_TOKEN  |
#      |warehouseId|2|
#      |skus|1,5,6|
#      |outletId|5|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|

  @Negative @Validation
  Scenario: Get SKU units list with invalid warehouse ID
    And I send the GET request to "skunits_get_skunits_list" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
      |warehouseId|abc|
      |skus||
      |outletId|5|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: Get SKU units list with non-existent warehouse ID
    And I send the GET request to "skunits_get_skunits_list" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
      |warehouseId|999999|
      |skus||
      |outletId|5|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: Get SKU units list with invalid outlet ID
    And I send the GET request to "skunits_get_skunits_list" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
      |warehouseId|2|
      |skus||
      |outletId|abc|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: Get SKU units list with non-existent outlet ID
    And I send the GET request to "skunits_get_skunits_list" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
      |warehouseId|2|
      |skus||
      |outletId|999999|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: Get SKU units list with missing warehouse ID
    And I send the GET request to "skunits_get_skunits_list" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
      |skus||
      |outletId|5|
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @Validation
  Scenario: Get SKU units list with missing outlet ID
    And I send the GET request to "skunits_get_skunits_list" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
      |warehouseId|2|
      |skus||
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds

  @Negative @ErrorHandling
  Scenario: Get SKU units list with invalid endpoint
    And I send the GET request to "skunits_get_skunits_list_invalid" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
      |warehouseId|2|
      |skus||
      |outletId|5|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2000" milliseconds

  @Positive @Performance
  Scenario: Performance test for get SKU units list endpoint
    And I send the GET request to "skunits_get_skunits_list" endpoint with dynamic access token and query parameters
      |Query         |Value         |
      |access_token  |ACCESS_TOKEN  |
      |warehouseId|2|
      |skus||
      |outletId|5|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

#  @Positive @Regression
#  Scenario: Regression test for get SKU units list endpoint
#    And I send the GET request to "skunits_get_skunits_list" endpoint with dynamic access token and query parameters
#      |Query         |Value         |
#      |access_token  |ACCESS_TOKEN  |
#      |warehouseId|2|
#      |skus||
#      |outletId|5|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"Skunits found"|

#  @Positive @DataValidation
#  Scenario: Validate get SKU units list response structure
#    And I send the GET request to "skunits_get_skunits_list" endpoint with dynamic access token and query parameters
#      |Query         |Value         |
#      |access_token  |ACCESS_TOKEN  |
#      |warehouseId|2|
#      |skus||
#      |outletId|5|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"Skunits found"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|array|
#      |$.data[0]|object|
#      |$.data[0].Inventory|object|
#      |$.data[0].Inventory.skucode|string|
#      |$.data[0].Inventory.skunit_id|string|
#      |$.data[0].Inventory.batch_id|string|
#      |$.data[0].Inventory.availableinventory|string|
#      |$.data[0].Batch|object|
#      |$.data[0].Skunit|object|
#      |$.data[0].Skunit.id|string|
#      |$.data[0].Skunit.name|string|
#      |$.data[0].Skunit.skucode|string|
#      |$.data[0].Skunit.mrp|string|
#      |$.data[0].Skunit.price|string|
#      |$.data[0].Skunit.active|string|
#      |$.defaultprice|object|

#  @Positive @DataValidation
#  Scenario: Validate get SKU units list data array content
#    And I send the GET request to "skunits_get_skunits_list" endpoint with dynamic access token and query parameters
#      |Query         |Value         |
#      |access_token  |ACCESS_TOKEN  |
#      |warehouseId|2|
#      |skus||
#      |outletId|5|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.data[0].Inventory.skunit_id|string|
#      |$.data[0].Skunit.id|string|
#      |$.data[0].Skunit.name|string|
#      |$.data[0].Skunit.active|"1"|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.data[0].Skunit.company_id|string|
#      |$.data[0].Skunit.created|string|
#      |$.data[0].Skunit.modified|string|
#      |$.data[0].Skunit.unitspercase|string|
#      |$.data[0].Skunit.gst|string|
#      |$.data[0].Skunit.vat|string|
#      |$.data[0].Skunit.cess|string|

#  @Positive @DataValidation
#  Scenario: Validate get SKU units list defaultprice structure
#    And I send the GET request to "skunits_get_skunits_list" endpoint with dynamic access token and query parameters
#      |Query         |Value         |
#      |access_token  |ACCESS_TOKEN  |
#      |warehouseId|2|
#      |skus||
#      |outletId|5|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.defaultprice|object|
#      |$.defaultprice.1|object|
#      |$.defaultprice.1.mrp|string|
#      |$.defaultprice.1.price|string|
#      |$.defaultprice.1.minprice|string|
#      |$.defaultprice.1.maxprice|string|

#  @Positive @EndToEnd
#  Scenario: End-to-end get SKU units list data retrieval workflow
#    And I send the GET request to "skunits_get_skunits_list" endpoint with dynamic access token and query parameters
#      |Query         |Value         |
#      |access_token  |ACCESS_TOKEN  |
#      |warehouseId|2|
#      |skus||
#      |outletId|5|
#    Then I should see the response code as "200"
#    And verify response time is less than "2000" milliseconds
#    And the fields in response should match with expected values
#      |JPath|Value|
#      |$.Result|true|
#      |$.Reason|"Skunits found"|
#    And I store the response as "get_skunits_list_response" name using full path
#    And validating the response field data types
#      |JPath|ExpectedType|
#      |$.Result|boolean|
#      |$.Reason|string|
#      |$.data|array|
#      |$.data[0]|object|
#      |$.defaultprice|object|

