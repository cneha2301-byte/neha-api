@BizomWebAPI @PI @DiscountCategoriesManagement @DiscountCategoriesGetSkusForWarDiscountCat @IntegrationServices
Feature: Discount categories Get Skus For War Discount Category API Testing
  As a system user
  I want to test the discount_categories getSkusforWardiscountcat endpoint with path parameters
  So that I can ensure proper functionality and data retrieval for discount category based SKUs

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get skusforWardiscountcat without access token
    When I send the GET request to "discount_categories_getskusforwardiscountcat" endpoint with path parameters
      |Path|Value|
      |discountCategoryId|1|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke @PathParam
  Scenario: TC_02 Get skusforWardiscountcat for discountCategoryId 1 - status and basic fields
    And I send the GET request to "discount_categories_getskusforwardiscountcat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path             |Value|
      |access_token  |ACCESS_TOKEN   |discountCategoryId|1    |
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And the fields in response should match with expected values
      |JPath   |Value|
      |$.Result|true |
      |$.Reason|""   |

  @Positive @Structure @PathParam
  Scenario: TC_03 Validate response structure and data types for discountCategoryId 1
    And I send the GET request to "discount_categories_getskusforwardiscountcat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path             |Value|
      |access_token  |ACCESS_TOKEN   |discountCategoryId|1    |
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And validating the response field data types
      |JPath                         |ExpectedType|
      |$.Result                      |boolean     |
      |$.Reason                      |string      |
      |$.skunits                     |object      |
      |$.skunits['1']               |object      |
      |$.skunits['1'].Skunit        |object      |
      |$.skunits['1'].Skunit.id     |string      |
      |$.skunits['1'].Skunit.name   |string      |
      |$.skunits['1'].Skunit.skucode|string      |
      |$.skunits['1'].Skunit.mrp    |string      |
      |$.skunits['1'].Skunit.price  |string      |
      |$.skunits['1'].Skunit.state_cess|number   |

  @Positive @Functional @PathParam
  Scenario: TC_04 Validate first few SKUs content for discountCategoryId 1
    And I send the GET request to "discount_categories_getskusforwardiscountcat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path             |Value|
      |access_token  |ACCESS_TOKEN   |discountCategoryId|1    |
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds
    And I verify API response at path with DB and static values
      |JPath                          |Value        |
      |$.Result                       |true         |
      |$.Reason                       |""           |
      |$.skunits['1'].skucode |DB:skunits:skucode: id=1        |
      |$.skunits['1'].name    |DB:skunits:name: id=1           |
      |$.skunits['2'].skucode |DB:skunits:skucode: id=2        |
      |$.skunits['2'].name    |DB:skunits:name: id=2           |
      |$.skunits['3'].skucode |DB:skunits:skucode: id=3        |
      |$.skunits['3'].name    |DB:skunits:name: id=3           |
      |$.skunits['4'].skucode |DB:skunits:skucode: id=4        |
      |$.skunits['4'].name    |DB:skunits:name: id=4           |
      |$.skunits['5'].skucode |DB:skunits:skucode: id=5        |
      |$.skunits['5'].name    |DB:skunits:name: id=5           |

  @Positive @DBValidation @PathParam
  Scenario: TC_05 Validate SKUs against database master for discountCategoryId 1
    And I send the GET request to "discount_categories_getskusforwardiscountcat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path             |Value|
      |access_token  |ACCESS_TOKEN   |discountCategoryId|1    |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I verify API response at path with DB and static values
      |JPath                          |Value                           |
      |$.skunits['1'].name    |DB:skunits:name: id=1           |
      |$.skunits['1'].skucode |DB:skunits:skucode: id=1        |
      |$.skunits['2'].name    |DB:skunits:name: id=2           |
      |$.skunits['3'].name    |DB:skunits:name: id=3           |
      |$.skunits['5'].name    |DB:skunits:name: id=5           |

  @Positive @ArrayValidation @PathParam
  Scenario: TC_06 Validate skunits collection structure for discountCategoryId 1
    And I send the GET request to "discount_categories_getskusforwardiscountcat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path             |Value|
      |access_token  |ACCESS_TOKEN   |discountCategoryId|1    |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath                       |ExpectedType|
      |$.skunits                   |object      |
      |$.skunits['1'].Skunit      |object      |
      |$.skunits['2'].Skunit      |object      |
      |$.skunits['1'].Skunit.name |string      |
      |$.skunits['2'].Skunit.name |string      |

  @Positive @ContentValidation @PathParam
  Scenario: TC_07 Validate key content presence for discountCategoryId 1
    And I send the GET request to "discount_categories_getskusforwardiscountcat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path             |Value|
      |access_token  |ACCESS_TOKEN   |discountCategoryId|1    |
    Then I should see the response code as "200"
    And validating the response contains the following values
      |Value                    |
      |skunits                  |
      |id                       |
      |name                     |
      |mrp                      |
      |price                    |
      |skucode                  |
      |bookedinventory          |
      |alloworderwithoutinventory|

  @Positive @Structure @PathParam
  Scenario: TC_08 Validate non-null critical fields in SKUs
    And I send the GET request to "discount_categories_getskusforwardiscountcat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path             |Value|
      |access_token  |ACCESS_TOKEN   |discountCategoryId|1    |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verifies the field is not null
      |JPath                                      |
      |$.skunits['1'].id                  |
      |$.skunits['1'].name                |
      |$.skunits['1'].mrp                 |
      |$.skunits['1'].price               |
      |$.skunits['1'].bookedinventory     |
      |$.skunits['1'].alloworderwithoutinventory|

  @Positive @Headers @PathParam
  Scenario: TC_09 Validate response headers for discountCategoryId 1
    And I send the GET request to "discount_categories_getskusforwardiscountcat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path             |Value|
      |access_token  |ACCESS_TOKEN   |discountCategoryId|1    |
    Then I should see the response code as "200"
    And verify response headers
      |HeaderName   |HeaderValue                                       |
      |Content-Type |application/json |
      |Cache-Control|private, no-cache, no-store, must-revalidate      |
    And verify response time is less than "2500" milliseconds

  @Positive @ResponseStorage @PathParam
  Scenario: TC_10 Store skusforWardiscountcat response for further use
    And I send the GET request to "discount_categories_getskusforwardiscountcat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path             |Value|
      |access_token  |ACCESS_TOKEN   |discountCategoryId|1    |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And I store the response as "discount_categories_getskusforwardiscountcat_response" name using full path

  @Positive @Performance @PathParam
  Scenario: TC_11 Performance test for skusforWardiscountcat endpoint
    And I send the GET request to "discount_categories_getskusforwardiscountcat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path             |Value|
      |access_token  |ACCESS_TOKEN   |discountCategoryId|1    |
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Negative @Timeout @PathParam
  Scenario: TC_12 Test skusforWardiscountcat endpoint timeout handling
    And I send the GET request to "discount_categories_getskusforwardiscountcat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path             |Value|
      |access_token  |ACCESS_TOKEN   |discountCategoryId|1    |
    Then I should see the response code as "200"
    And verify response time is less than "5000" milliseconds

  @Negative @Validation @PathParam
  Scenario: TC_13 Get skusforWardiscountcat with invalid discountCategoryId (non-numeric)
    And I send the GET request to "discount_categories_getskusforwardiscountcat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path             |Value|
      |access_token  |ACCESS_TOKEN   |discountCategoryId|abc  |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Validation @PathParam
  Scenario: TC_14 Get skusforWardiscountcat with non-existent discountCategoryId
    And I send the GET request to "discount_categories_getskusforwardiscountcat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path             |Value   |
      |access_token  |ACCESS_TOKEN   |discountCategoryId|999999 |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Boundary @PathParam
  Scenario: TC_15 Get skusforWardiscountcat with boundary discountCategoryIds
    And I send the GET request to "discount_categories_getskusforwardiscountcat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path             |Value|
      |access_token  |ACCESS_TOKEN   |discountCategoryId|0   |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @ErrorHandling @PathParam
  Scenario: TC_16 Get skusforWardiscountcat invalid endpoint with path param
    And I send the GET request to "discount_categories_getskusforwardiscountcat_invalid" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path             |Value|
      |access_token  |ACCESS_TOKEN   |discountCategoryId|1    |
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Regression @PathParam
  Scenario: TC_17 Regression test for skusforWardiscountcat endpoint
    And I send the GET request to "discount_categories_getskusforwardiscountcat" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path             |Value|
      |access_token  |ACCESS_TOKEN   |discountCategoryId|1    |
    Then I should see the response code as "200"
    And verify response time is less than "2000" milliseconds


