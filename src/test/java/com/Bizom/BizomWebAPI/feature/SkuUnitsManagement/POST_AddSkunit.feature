@BizomWebAPI @SkuUnitsManagement @AddSkunit @ProductManagement @OS
Feature: This feature file is of the testcases of POST end point of add SKU units

#-------------------------------------------------------------------------------------------------

#  @Test_1-positive
#  Scenario: TC_01 CreateNewSkunit - positive case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_AddSkunit" payload
#      |JPath       |Value       |
#      |$.data.Skunit.name  | randomString:15 |
#      |$.data.Skunit.mrp  | randomInt |
#      |$.data.Skunit.gst  | 0 |
#      |$.data.Skunit.hsncode  |  |
#      |$.data.Skunit.price  | randomInt |
#      |$.data.Skunit.unitspercase  | randomSmallInt |
#      |$.data.Skunit.abbr  |  |
#      |$.data.Skunit.skucode  |  |
#      |$.data.Skunit.description  |  |
#      |$.data.Skunit.unitcase  | 1 |
#      |$.data.Skunit.standardcase  |  |
#      |$.data.Skunit.brand_id  | DB:brands:id: id=1 LIMIT 1 |
#      |$.data.Skunit.subbrand_id  | DB:subbrands:id: id=1 LIMIT 1 |
#      |$.data.Skunit.packaging_id  | DB:packagings:id: id=1 LIMIT 1 |
#      |$.data.Skunit.size_id  | DB:sizes:id: id=1 LIMIT 1 |
#      |$.data.Skunit.category_id  | DB:categories:id: id=1 LIMIT 1 |
#      |$.data.Skunit.expiry_timeline  |  |
#      |$.data.Skunit.isuniqueserialnumber  | 0 |
#      |$.data.Skunit.is_promosku  | 0 |
#      |$.data.Skunit.fordevice  | 1 |
#      |$.data.Skunit.focussku  | 0 |
#      |$.data.Skunit.package_size  | 0 |
#      |$.data.Skunit.gstSlabs[0].fromAmount  |  |
#      |$.data.Skunit.gstSlabs[0].toAmount  |  |
#      |$.data.Skunit.gstSlabs[0].gst  |  |
#
#    And I post the request with "POST_AddSkunit" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds
#    And I verify the data got updated as needed from DB
#      |expectedColumn|expectedValue|
#      |DB:skunits:brand_id: id=(SELECT MAX(id) FROM skunits)|DB:brands:id: id=1 LIMIT 1|
#
#      |DB:skunits:fordevice: id=(SELECT MAX(id) FROM skunits)|1|
#

    #-----------------------------------------------------------------------------------------------------

#  @Test_2-negative
#  Scenario: TC_02 CreateNewSkunit without access token - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_AddSkunit" payload
#      |JPath       |Value       |
#      |$.data.Skunit.name  | randomString:15 |
#      |$.data.Skunit.mrp  | randomInt |
#      |$.data.Skunit.gst  | 0 |
#      |$.data.Skunit.hsncode  |  |
#      |$.data.Skunit.price  | randomInt |
#      |$.data.Skunit.unitspercase  | randomSmallInt |
#      |$.data.Skunit.abbr  |  |
#      |$.data.Skunit.skucode  |  |
#      |$.data.Skunit.description  |  |
#      |$.data.Skunit.unitcase  | 1 |
#      |$.data.Skunit.standardcase  |  |
#      |$.data.Skunit.brand_id  | DB:brands:id: id=1 LIMIT 1 |
#      |$.data.Skunit.subbrand_id  | DB:subbrands:id: id=1 LIMIT 1 |
#      |$.data.Skunit.packaging_id  | DB:packagings:id: id=1 LIMIT 1 |
#      |$.data.Skunit.size_id  | DB:sizes:id: id=1 LIMIT 1 |
#      |$.data.Skunit.category_id  | DB:categories:id: id=1 LIMIT 1 |
#      |$.data.Skunit.expiry_timeline  |  |
#      |$.data.Skunit.isuniqueserialnumber  | 0 |
#      |$.data.Skunit.is_promosku  | 0 |
#      |$.data.Skunit.fordevice  | 1 |
#      |$.data.Skunit.focussku  | 0 |
#      |$.data.Skunit.package_size  | 0 |
#      |$.data.Skunit.gstSlabs[0].fromAmount  |  |
#      |$.data.Skunit.gstSlabs[0].toAmount  |  |
#      |$.data.Skunit.gstSlabs[0].gst  |  |
#
#    And I post the request with "POST_AddSkunit" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |  |
#    Then I should see the response code as "302"
#    And the fields in response should match with expected values
#      | JPath     | Value    |
#      |$.error    |"invalid_request"|
#    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------

#  @Test_3-negative
#  Scenario: TC_03 CreateNewSkunit with duplicate SKU name - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_AddSkunit" payload
#      |JPath       |Value       |
#      |$.data.Skunit.name  | DB:skunits:name: id=1 LIMIT 1 |
#      |$.data.Skunit.mrp  | randomInt |
#      |$.data.Skunit.gst  | 0 |
#      |$.data.Skunit.hsncode  |  |
#      |$.data.Skunit.price  | randomInt |
#      |$.data.Skunit.unitspercase  | randomSmallInt |
#      |$.data.Skunit.abbr  |  |
#      |$.data.Skunit.skucode  | DB:skunits:skucode: id=1 LIMIT 1 |
#      |$.data.Skunit.description  |  |
#      |$.data.Skunit.unitcase  | 1 |
#      |$.data.Skunit.standardcase  |  |
#      |$.data.Skunit.brand_id  | DB:brands:id: id=1 LIMIT 1 |
#      |$.data.Skunit.subbrand_id  | DB:subbrands:id: id=1 LIMIT 1 |
#      |$.data.Skunit.packaging_id  | DB:packagings:id: id=1 LIMIT 1 |
#      |$.data.Skunit.size_id  | DB:sizes:id: id=1 LIMIT 1 |
#      |$.data.Skunit.category_id  | DB:categories:id: id=1 LIMIT 1 |
#      |$.data.Skunit.expiry_timeline  |  |
#      |$.data.Skunit.isuniqueserialnumber  | 0 |
#      |$.data.Skunit.is_promosku  | 0 |
#      |$.data.Skunit.fordevice  | 1 |
#      |$.data.Skunit.focussku  | 0 |
#      |$.data.Skunit.package_size  | 0 |
#      |$.data.Skunit.gstSlabs[0].fromAmount  |  |
#      |$.data.Skunit.gstSlabs[0].toAmount  |  |
#      |$.data.Skunit.gstSlabs[0].gst  |  |
#
#    And I post the request with "POST_AddSkunit" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "302"
#    And the fields in response should match with expected values
#      | JPath     | Value    |
#      |$.message             |"The given data was invalid."|
#      |$.errors."Skunit.skucode"[0]             |contains "The SKU could not be saved as the combination of SKU name and code already exists"|
#    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

#  @Test_4-negative @Validation
#  Scenario: TC_04 CreateNewSkunit with blank name field - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_AddSkunit" payload
#      |JPath       |Value       |
#      |$.data.Skunit.name  |  |
#      |$.data.Skunit.mrp  | randomInt |
#      |$.data.Skunit.gst  | 0 |
#      |$.data.Skunit.price  | randomInt |
#      |$.data.Skunit.unitspercase  | randomSmallInt |
#      |$.data.Skunit.unitcase  | 1 |
#      |$.data.Skunit.brand_id  | DB:brands:id: id=1 LIMIT 1 |
#      |$.data.Skunit.subbrand_id  | DB:subbrands:id: id=1 LIMIT 1 |
#      |$.data.Skunit.packaging_id  | DB:packagings:id: id=1 LIMIT 1 |
#      |$.data.Skunit.size_id  | DB:sizes:id: id=1 LIMIT 1 |
#      |$.data.Skunit.category_id  | DB:categories:id: id=1 LIMIT 1 |
#      |$.data.Skunit.fordevice  | 1 |
#      |$.data.Skunit.focussku  | 0 |
#      |$.data.Skunit.package_size  | 0 |
#
#    And I post the request with "POST_AddSkunit" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

#  @Test_5-negative @Validation
#  Scenario: TC_05 CreateNewSkunit with blank mrp field - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_AddSkunit" payload
#      |JPath       |Value       |
#      |$.data.Skunit.name  | randomString:15 |
#      |$.data.Skunit.mrp  |  |
#      |$.data.Skunit.gst  | 0 |
#      |$.data.Skunit.price  | randomInt |
#      |$.data.Skunit.unitspercase  | randomSmallInt |
#      |$.data.Skunit.unitcase  | 1 |
#      |$.data.Skunit.brand_id  | DB:brands:id: id=1 LIMIT 1 |
#      |$.data.Skunit.subbrand_id  | DB:subbrands:id: id=1 LIMIT 1 |
#      |$.data.Skunit.packaging_id  | DB:packagings:id: id=1 LIMIT 1 |
#      |$.data.Skunit.size_id  | DB:sizes:id: id=1 LIMIT 1 |
#      |$.data.Skunit.category_id  | DB:categories:id: id=1 LIMIT 1 |
#      |$.data.Skunit.fordevice  | 1 |
#      |$.data.Skunit.focussku  | 0 |
#      |$.data.Skunit.package_size  | 0 |
#
#    And I post the request with "POST_AddSkunit" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

#  @Test_6-negative @Validation
#  Scenario: TC_06 CreateNewSkunit with blank price field - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_AddSkunit" payload
#      |JPath       |Value       |
#      |$.data.Skunit.name  | randomString:15 |
#      |$.data.Skunit.mrp  | randomInt |
#      |$.data.Skunit.gst  | 0 |
#      |$.data.Skunit.price  |  |
#      |$.data.Skunit.unitspercase  | randomSmallInt |
#      |$.data.Skunit.unitcase  | 1 |
#      |$.data.Skunit.brand_id  | DB:brands:id: id=1 LIMIT 1 |
#      |$.data.Skunit.subbrand_id  | DB:subbrands:id: id=1 LIMIT 1 |
#      |$.data.Skunit.packaging_id  | DB:packagings:id: id=1 LIMIT 1 |
#      |$.data.Skunit.size_id  | DB:sizes:id: id=1 LIMIT 1 |
#      |$.data.Skunit.category_id  | DB:categories:id: id=1 LIMIT 1 |
#      |$.data.Skunit.fordevice  | 1 |
#      |$.data.Skunit.focussku  | 0 |
#      |$.data.Skunit.package_size  | 0 |
#
#    And I post the request with "POST_AddSkunit" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

#  @Test_7-negative @Validation
#  Scenario: TC_07 CreateNewSkunit with blank brand_id field - Negative case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_AddSkunit" payload
#      |JPath       |Value       |
#      |$.data.Skunit.name  | randomString:15 |
#      |$.data.Skunit.mrp  | randomInt |
#      |$.data.Skunit.gst  | 0 |
#      |$.data.Skunit.price  | randomInt |
#      |$.data.Skunit.unitspercase  | randomSmallInt |
#      |$.data.Skunit.unitcase  | 1 |
#      |$.data.Skunit.brand_id  |  |
#      |$.data.Skunit.subbrand_id  | DB:subbrands:id: id=1 LIMIT 1 |
#      |$.data.Skunit.packaging_id  | DB:packagings:id: id=1 LIMIT 1 |
#      |$.data.Skunit.size_id  | DB:sizes:id: id=1 LIMIT 1 |
#      |$.data.Skunit.category_id  | DB:categories:id: id=1 LIMIT 1 |
#      |$.data.Skunit.fordevice  | 1 |
#      |$.data.Skunit.focussku  | 0 |
#      |$.data.Skunit.package_size  | 0 |
#
#    And I post the request with "POST_AddSkunit" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_8-negative @Validation
  Scenario: TC_08 CreateNewSkunit with negative mrp value - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_AddSkunit" payload
      |JPath       |Value       |
      |$.data.Skunit.name  | randomString:15 |
      |$.data.Skunit.mrp  | -100 |
      |$.data.Skunit.gst  | 0 |
      |$.data.Skunit.price  | randomInt |
      |$.data.Skunit.unitspercase  | randomSmallInt |
      |$.data.Skunit.unitcase  | 1 |
      |$.data.Skunit.brand_id  | DB:brands:id: id=1 LIMIT 1 |
      |$.data.Skunit.subbrand_id  | DB:subbrands:id: id=1 LIMIT 1 |
      |$.data.Skunit.packaging_id  | DB:packagings:id: id=1 LIMIT 1 |
      |$.data.Skunit.size_id  | DB:sizes:id: id=1 LIMIT 1 |
      |$.data.Skunit.category_id  | DB:categories:id: id=1 LIMIT 1 |
      |$.data.Skunit.fordevice  | 1 |
      |$.data.Skunit.focussku  | 0 |
      |$.data.Skunit.package_size  | 0 |

    And I post the request with "POST_AddSkunit" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_9-negative @Validation
  Scenario: TC_09 CreateNewSkunit with negative price value - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_AddSkunit" payload
      |JPath       |Value       |
      |$.data.Skunit.name  | randomString:15 |
      |$.data.Skunit.mrp  | randomInt |
      |$.data.Skunit.gst  | 0 |
      |$.data.Skunit.price  | -50 |
      |$.data.Skunit.unitspercase  | randomSmallInt |
      |$.data.Skunit.unitcase  | 1 |
      |$.data.Skunit.brand_id  | DB:brands:id: id=1 LIMIT 1 |
      |$.data.Skunit.subbrand_id  | DB:subbrands:id: id=1 LIMIT 1 |
      |$.data.Skunit.packaging_id  | DB:packagings:id: id=1 LIMIT 1 |
      |$.data.Skunit.size_id  | DB:sizes:id: id=1 LIMIT 1 |
      |$.data.Skunit.category_id  | DB:categories:id: id=1 LIMIT 1 |
      |$.data.Skunit.fordevice  | 1 |
      |$.data.Skunit.focussku  | 0 |
      |$.data.Skunit.package_size  | 0 |

    And I post the request with "POST_AddSkunit" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_10-negative @Validation
  Scenario: TC_10 CreateNewSkunit with zero unitspercase - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_AddSkunit" payload
      |JPath       |Value       |
      |$.data.Skunit.name  | randomString:15 |
      |$.data.Skunit.mrp  | randomInt |
      |$.data.Skunit.gst  | 0 |
      |$.data.Skunit.price  | randomInt |
      |$.data.Skunit.unitspercase  | 0 |
      |$.data.Skunit.unitcase  | 1 |
      |$.data.Skunit.brand_id  | DB:brands:id: id=1 LIMIT 1 |
      |$.data.Skunit.subbrand_id  | DB:subbrands:id: id=1 LIMIT 1 |
      |$.data.Skunit.packaging_id  | DB:packagings:id: id=1 LIMIT 1 |
      |$.data.Skunit.size_id  | DB:sizes:id: id=1 LIMIT 1 |
      |$.data.Skunit.category_id  | DB:categories:id: id=1 LIMIT 1 |
      |$.data.Skunit.fordevice  | 1 |
      |$.data.Skunit.focussku  | 0 |
      |$.data.Skunit.package_size  | 0 |

    And I post the request with "POST_AddSkunit" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_11-negative @Validation
  Scenario: TC_11 CreateNewSkunit with invalid gst value greater than 100 - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_AddSkunit" payload
      |JPath       |Value       |
      |$.data.Skunit.name  | randomString:15 |
      |$.data.Skunit.mrp  | randomInt |
      |$.data.Skunit.gst  | 150 |
      |$.data.Skunit.price  | randomInt |
      |$.data.Skunit.unitspercase  | randomSmallInt |
      |$.data.Skunit.unitcase  | 1 |
      |$.data.Skunit.brand_id  | DB:brands:id: id=1 LIMIT 1 |
      |$.data.Skunit.subbrand_id  | DB:subbrands:id: id=1 LIMIT 1 |
      |$.data.Skunit.packaging_id  | DB:packagings:id: id=1 LIMIT 1 |
      |$.data.Skunit.size_id  | DB:sizes:id: id=1 LIMIT 1 |
      |$.data.Skunit.category_id  | DB:categories:id: id=1 LIMIT 1 |
      |$.data.Skunit.fordevice  | 1 |
      |$.data.Skunit.focussku  | 0 |
      |$.data.Skunit.package_size  | 0 |

    And I post the request with "POST_AddSkunit" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_12-negative @Validation
  Scenario: TC_12 CreateNewSkunit with invalid brand_id - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_AddSkunit" payload
      |JPath       |Value       |
      |$.data.Skunit.name  | randomString:15 |
      |$.data.Skunit.mrp  | randomInt |
      |$.data.Skunit.gst  | 0 |
      |$.data.Skunit.price  | randomInt |
      |$.data.Skunit.unitspercase  | randomSmallInt |
      |$.data.Skunit.unitcase  | 1 |
      |$.data.Skunit.brand_id  | 99999 |
      |$.data.Skunit.subbrand_id  | DB:subbrands:id: id=1 LIMIT 1 |
      |$.data.Skunit.packaging_id  | DB:packagings:id: id=1 LIMIT 1 |
      |$.data.Skunit.size_id  | DB:sizes:id: id=1 LIMIT 1 |
      |$.data.Skunit.category_id  | DB:categories:id: id=1 LIMIT 1 |
      |$.data.Skunit.fordevice  | 1 |
      |$.data.Skunit.focussku  | 0 |
      |$.data.Skunit.package_size  | 0 |

    And I post the request with "POST_AddSkunit" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_13-negative @Validation
  Scenario: TC_13 CreateNewSkunit with invalid category_id - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_AddSkunit" payload
      |JPath       |Value       |
      |$.data.Skunit.name  | randomString:15 |
      |$.data.Skunit.mrp  | randomInt |
      |$.data.Skunit.gst  | 0 |
      |$.data.Skunit.price  | randomInt |
      |$.data.Skunit.unitspercase  | randomSmallInt |
      |$.data.Skunit.unitcase  | 1 |
      |$.data.Skunit.brand_id  | DB:brands:id: id=1 LIMIT 1 |
      |$.data.Skunit.subbrand_id  | DB:subbrands:id: id=1 LIMIT 1 |
      |$.data.Skunit.packaging_id  | DB:packagings:id: id=1 LIMIT 1 |
      |$.data.Skunit.size_id  | DB:sizes:id: id=1 LIMIT 1 |
      |$.data.Skunit.category_id  | 99999 |
      |$.data.Skunit.fordevice  | 1 |
      |$.data.Skunit.focussku  | 0 |
      |$.data.Skunit.package_size  | 0 |

    And I post the request with "POST_AddSkunit" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_14-negative @Validation
  Scenario: TC_14 CreateNewSkunit with string value for numeric field mrp - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_AddSkunit" payload
      |JPath       |Value       |
      |$.data.Skunit.name  | randomString:15 |
      |$.data.Skunit.mrp  | invalidNumber |
      |$.data.Skunit.gst  | 0 |
      |$.data.Skunit.price  | randomInt |
      |$.data.Skunit.unitspercase  | randomSmallInt |
      |$.data.Skunit.unitcase  | 1 |
      |$.data.Skunit.brand_id  | DB:brands:id: id=1 LIMIT 1 |
      |$.data.Skunit.subbrand_id  | DB:subbrands:id: id=1 LIMIT 1 |
      |$.data.Skunit.packaging_id  | DB:packagings:id: id=1 LIMIT 1 |
      |$.data.Skunit.size_id  | DB:sizes:id: id=1 LIMIT 1 |
      |$.data.Skunit.category_id  | DB:categories:id: id=1 LIMIT 1 |
      |$.data.Skunit.fordevice  | 1 |
      |$.data.Skunit.focussku  | 0 |
      |$.data.Skunit.package_size  | 0 |

    And I post the request with "POST_AddSkunit" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_15-negative @Validation
  Scenario: TC_15 CreateNewSkunit with string value for numeric field price - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_AddSkunit" payload
      |JPath       |Value       |
      |$.data.Skunit.name  | randomString:15 |
      |$.data.Skunit.mrp  | randomInt |
      |$.data.Skunit.gst  | 0 |
      |$.data.Skunit.price  | invalidPrice |
      |$.data.Skunit.unitspercase  | randomSmallInt |
      |$.data.Skunit.unitcase  | 1 |
      |$.data.Skunit.brand_id  | DB:brands:id: id=1 LIMIT 1 |
      |$.data.Skunit.subbrand_id  | DB:subbrands:id: id=1 LIMIT 1 |
      |$.data.Skunit.packaging_id  | DB:packagings:id: id=1 LIMIT 1 |
      |$.data.Skunit.size_id  | DB:sizes:id: id=1 LIMIT 1 |
      |$.data.Skunit.category_id  | DB:categories:id: id=1 LIMIT 1 |
      |$.data.Skunit.fordevice  | 1 |
      |$.data.Skunit.focussku  | 0 |
      |$.data.Skunit.package_size  | 0 |

    And I post the request with "POST_AddSkunit" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_16-negative @Validation
  Scenario: TC_16 CreateNewSkunit with invalid boolean value for fordevice - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_AddSkunit" payload
      |JPath       |Value       |
      |$.data.Skunit.name  | randomString:15 |
      |$.data.Skunit.mrp  | randomInt |
      |$.data.Skunit.gst  | 0 |
      |$.data.Skunit.price  | randomInt |
      |$.data.Skunit.unitspercase  | randomSmallInt |
      |$.data.Skunit.unitcase  | 1 |
      |$.data.Skunit.brand_id  | DB:brands:id: id=1 LIMIT 1 |
      |$.data.Skunit.subbrand_id  | DB:subbrands:id: id=1 LIMIT 1 |
      |$.data.Skunit.packaging_id  | DB:packagings:id: id=1 LIMIT 1 |
      |$.data.Skunit.size_id  | DB:sizes:id: id=1 LIMIT 1 |
      |$.data.Skunit.category_id  | DB:categories:id: id=1 LIMIT 1 |
      |$.data.Skunit.fordevice  | invalidBoolean |
      |$.data.Skunit.focussku  | 0 |
      |$.data.Skunit.package_size  | 0 |

    And I post the request with "POST_AddSkunit" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_17-positive
  Scenario: TC_17 CreateNewSkunit with all optional fields populated - positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_AddSkunit" payload
      |JPath       |Value       |
      |$.data.Skunit.name  | randomString:20 |
      |$.data.Skunit.mrp  | randomInt |
      |$.data.Skunit.gst  | 5 |
      |$.data.Skunit.hsncode  | randomAlphanumeric |
      |$.data.Skunit.price  | randomInt |
      |$.data.Skunit.unitspercase  | randomSmallInt |
      |$.data.Skunit.abbr  | randomString:5 |
      |$.data.Skunit.skucode  | randomAlphanumeric |
      |$.data.Skunit.description  | randomString:30 |
      |$.data.Skunit.unitcase  | 1 |
      |$.data.Skunit.standardcase  | randomSmallInt |
      |$.data.Skunit.brand_id  | DB:brands:id: id=1 LIMIT 1 |
      |$.data.Skunit.subbrand_id  | DB:subbrands:id: id=1 LIMIT 1 |
      |$.data.Skunit.packaging_id  | DB:packagings:id: id=1 LIMIT 1 |
      |$.data.Skunit.size_id  | DB:sizes:id: id=1 LIMIT 1 |
      |$.data.Skunit.category_id  | DB:categories:id: id=1 LIMIT 1 |
      |$.data.Skunit.expiry_timeline  | randomSmallInt |
      |$.data.Skunit.isuniqueserialnumber  | 1 |
      |$.data.Skunit.is_promosku  | 1 |
      |$.data.Skunit.fordevice  | 1 |
      |$.data.Skunit.focussku  | 1 |
      |$.data.Skunit.package_size  | randomSmallInt |
      |$.data.Skunit.gstSlabs[0].fromAmount  | randomInt |
      |$.data.Skunit.gstSlabs[0].toAmount  | randomInt |
      |$.data.Skunit.gstSlabs[0].gst  | 5 |

    And I post the request with "POST_AddSkunit" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds
    And I verify the data got updated as needed from DB
      |expectedColumn|expectedValue|
      |DB:skunits:brand_id: id=(SELECT MAX(id) FROM skunits)|DB:brands:id: id=1 LIMIT 1|
     
      |DB:skunits:fordevice: id=(SELECT MAX(id) FROM skunits)|1|
      |DB:skunits:focussku: id=(SELECT MAX(id) FROM skunits)|1|
      |DB:skunits:is_promosku: id=(SELECT MAX(id) FROM skunits)|1|

    #-----------------------------------------------------------------------------------------------------

  @Test_18-positive
  Scenario: TC_18 CreateNewSkunit with minimum required fields only - positive case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_AddSkunit" payload
      |JPath       |Value       |
      |$.data.Skunit.name  | randomString:15 |
      |$.data.Skunit.mrp  | randomInt |
      |$.data.Skunit.gst  | 0 |
      |$.data.Skunit.price  | randomInt |
      |$.data.Skunit.unitspercase  | 1 |
      |$.data.Skunit.unitcase  | 1 |
      |$.data.Skunit.brand_id  | DB:brands:id: id=1 LIMIT 1 |
      |$.data.Skunit.category_id  | DB:categories:id: id=1 LIMIT 1 |
      |$.data.Skunit.fordevice  | 1 |

    And I post the request with "POST_AddSkunit" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds
    And I verify the data got updated as needed from DB
      |expectedColumn|expectedValue|
      |DB:skunits:name: id=(SELECT MAX(id) FROM skunits)|randomString|
      |DB:skunits:brand_id: id=(SELECT MAX(id) FROM skunits)|DB:brands:id: id=1 LIMIT 1|
     
      |DB:skunits:fordevice: id=(SELECT MAX(id) FROM skunits)|1|
      |DB:skunits:unitspercase: id=(SELECT MAX(id) FROM skunits)|1|
      |DB:skunits:price: id=(SELECT MAX(id) FROM skunits)|randomString|

    #-----------------------------------------------------------------------------------------------------

  @Test_19-negative @Validation
  Scenario: TC_19 CreateNewSkunit with very long name field - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_AddSkunit" payload
      |JPath       |Value       |
      |$.data.Skunit.name  | randomString:500 |
      |$.data.Skunit.mrp  | randomInt |
      |$.data.Skunit.gst  | 0 |
      |$.data.Skunit.price  | randomInt |
      |$.data.Skunit.unitspercase  | randomSmallInt |
      |$.data.Skunit.unitcase  | 1 |
      |$.data.Skunit.brand_id  | DB:brands:id: id=1 LIMIT 1 |
      |$.data.Skunit.subbrand_id  | DB:subbrands:id: id=1 LIMIT 1 |
      |$.data.Skunit.packaging_id  | DB:packagings:id: id=1 LIMIT 1 |
      |$.data.Skunit.size_id  | DB:sizes:id: id=1 LIMIT 1 |
      |$.data.Skunit.category_id  | DB:categories:id: id=1 LIMIT 1 |
      |$.data.Skunit.fordevice  | 1 |
      |$.data.Skunit.focussku  | 0 |
      |$.data.Skunit.package_size  | 0 |

    And I post the request with "POST_AddSkunit" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_20-negative @Validation
  Scenario: TC_20 CreateNewSkunit with zero mrp value - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_AddSkunit" payload
      |JPath       |Value       |
      |$.data.Skunit.name  | randomString:15 |
      |$.data.Skunit.mrp  | 0 |
      |$.data.Skunit.gst  | 0 |
      |$.data.Skunit.price  | randomInt |
      |$.data.Skunit.unitspercase  | randomSmallInt |
      |$.data.Skunit.unitcase  | 1 |
      |$.data.Skunit.brand_id  | DB:brands:id: id=1 LIMIT 1 |
      |$.data.Skunit.subbrand_id  | DB:subbrands:id: id=1 LIMIT 1 |
      |$.data.Skunit.packaging_id  | DB:packagings:id: id=1 LIMIT 1 |
      |$.data.Skunit.size_id  | DB:sizes:id: id=1 LIMIT 1 |
      |$.data.Skunit.category_id  | DB:categories:id: id=1 LIMIT 1 |
      |$.data.Skunit.fordevice  | 1 |
      |$.data.Skunit.focussku  | 0 |
      |$.data.Skunit.package_size  | 0 |

    And I post the request with "POST_AddSkunit" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_21-negative @Validation
  Scenario: TC_21 CreateNewSkunit with zero price value - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_AddSkunit" payload
      |JPath       |Value       |
      |$.data.Skunit.name  | randomString:15 |
      |$.data.Skunit.mrp  | randomInt |
      |$.data.Skunit.gst  | 0 |
      |$.data.Skunit.price  | 0 |
      |$.data.Skunit.unitspercase  | randomSmallInt |
      |$.data.Skunit.unitcase  | 1 |
      |$.data.Skunit.brand_id  | DB:brands:id: id=1 LIMIT 1 |
      |$.data.Skunit.subbrand_id  | DB:subbrands:id: id=1 LIMIT 1 |
      |$.data.Skunit.packaging_id  | DB:packagings:id: id=1 LIMIT 1 |
      |$.data.Skunit.size_id  | DB:sizes:id: id=1 LIMIT 1 |
      |$.data.Skunit.category_id  | DB:categories:id: id=1 LIMIT 1 |
      |$.data.Skunit.fordevice  | 1 |
      |$.data.Skunit.focussku  | 0 |
      |$.data.Skunit.package_size  | 0 |

    And I post the request with "POST_AddSkunit" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_22-negative @Validation
  Scenario: TC_22 CreateNewSkunit with invalid packaging_id - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_AddSkunit" payload
      |JPath       |Value       |
      |$.data.Skunit.name  | randomString:15 |
      |$.data.Skunit.mrp  | randomInt |
      |$.data.Skunit.gst  | 0 |
      |$.data.Skunit.price  | randomInt |
      |$.data.Skunit.unitspercase  | randomSmallInt |
      |$.data.Skunit.unitcase  | 1 |
      |$.data.Skunit.brand_id  | DB:brands:id: id=1 LIMIT 1 |
      |$.data.Skunit.subbrand_id  | DB:subbrands:id: id=1 LIMIT 1 |
      |$.data.Skunit.packaging_id  | 99999 |
      |$.data.Skunit.size_id  | DB:sizes:id: id=1 LIMIT 1 |
      |$.data.Skunit.category_id  | DB:categories:id: id=1 LIMIT 1 |
      |$.data.Skunit.fordevice  | 1 |
      |$.data.Skunit.focussku  | 0 |
      |$.data.Skunit.package_size  | 0 |

    And I post the request with "POST_AddSkunit" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_23-negative @Validation
  Scenario: TC_23 CreateNewSkunit with invalid size_id - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_AddSkunit" payload
      |JPath       |Value       |
      |$.data.Skunit.name  | randomString:15 |
      |$.data.Skunit.mrp  | randomInt |
      |$.data.Skunit.gst  | 0 |
      |$.data.Skunit.price  | randomInt |
      |$.data.Skunit.unitspercase  | randomSmallInt |
      |$.data.Skunit.unitcase  | 1 |
      |$.data.Skunit.brand_id  | DB:brands:id: id=1 LIMIT 1 |
      |$.data.Skunit.subbrand_id  | DB:subbrands:id: id=1 LIMIT 1 |
      |$.data.Skunit.packaging_id  | DB:packagings:id: id=1 LIMIT 1 |
      |$.data.Skunit.size_id  | 99999 |
      |$.data.Skunit.category_id  | DB:categories:id: id=1 LIMIT 1 |
      |$.data.Skunit.fordevice  | 1 |
      |$.data.Skunit.focussku  | 0 |
      |$.data.Skunit.package_size  | 0 |

    And I post the request with "POST_AddSkunit" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

  @Test_24-negative @Validation
  Scenario: TC_24 CreateNewSkunit with invalid subbrand_id - Negative case
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "POST_AddSkunit" payload
      |JPath       |Value       |
      |$.data.Skunit.name  | randomString:15 |
      |$.data.Skunit.mrp  | randomInt |
      |$.data.Skunit.gst  | 0 |
      |$.data.Skunit.price  | randomInt |
      |$.data.Skunit.unitspercase  | randomSmallInt |
      |$.data.Skunit.unitcase  | 1 |
      |$.data.Skunit.brand_id  | DB:brands:id: id=1 LIMIT 1 |
      |$.data.Skunit.subbrand_id  | 99999 |
      |$.data.Skunit.packaging_id  | DB:packagings:id: id=1 LIMIT 1 |
      |$.data.Skunit.size_id  | DB:sizes:id: id=1 LIMIT 1 |
      |$.data.Skunit.category_id  | DB:categories:id: id=1 LIMIT 1 |
      |$.data.Skunit.fordevice  | 1 |
      |$.data.Skunit.focussku  | 0 |
      |$.data.Skunit.package_size  | 0 |

    And I post the request with "POST_AddSkunit" payload with dynamic access token and query parameters
      |Query         |Value                           |
      |access_token  |ACCESS_TOKEN  |
    Then I should see the response code as "302"
    And verify response time is less than "2500" milliseconds

    #-----------------------------------------------------------------------------------------------------

#  @Test_25-positive
#  Scenario: TC_25 CreateNewSkunit with boundary values - positive case
#    Given I set up base URI for transactions
#    When I set up request specification
#      |HeaderName|HeaderValue|
#      |Accept|*/*|
#      |Accept-Encoding|gzip,deflate, br|
#      |Connection|keep-alive|
#      |Content-Type|application/json|
#    And I modify fields with random values and remove fields in "POST_AddSkunit" payload
#      |JPath       |Value       |
#      |$.data.Skunit.name  | randomString:15 |
#      |$.data.Skunit.mrp  | 999999 |
#      |$.data.Skunit.gst  | 28 |
#      |$.data.Skunit.price  | 999999 |
#      |$.data.Skunit.unitspercase  | 999 |
#      |$.data.Skunit.unitcase  | 1 |
#      |$.data.Skunit.brand_id  | DB:brands:id: id=1 LIMIT 1 |
#      |$.data.Skunit.subbrand_id  | DB:subbrands:id: id=1 LIMIT 1 |
#      |$.data.Skunit.packaging_id  | DB:packagings:id: id=1 LIMIT 1 |
#      |$.data.Skunit.size_id  | DB:sizes:id: id=1 LIMIT 1 |
#      |$.data.Skunit.category_id  | DB:categories:id: id=1 LIMIT 1 |
#      |$.data.Skunit.fordevice  | 1 |
#      |$.data.Skunit.focussku  | 0 |
#      |$.data.Skunit.package_size  | 0 |
#
#    And I post the request with "POST_AddSkunit" payload with dynamic access token and query parameters
#      |Query         |Value                           |
#      |access_token  |ACCESS_TOKEN  |
#    Then I should see the response code as "302"
#    And verify response time is less than "2500" milliseconds
#    And I verify the data got updated as needed from DB
#      |expectedColumn|expectedValue|
#      |DB:skunits:brand_id: id=(SELECT MAX(id) FROM skunits)|DB:brands:id: id=1 LIMIT 1|
#
#      |DB:skunits:fordevice: id=(SELECT MAX(id) FROM skunits)|1|
#      |DB:skunits:unitspercase: id=(SELECT MAX(id) FROM skunits)|999|
#      |DB:skunits:gst: id=(SELECT MAX(id) FROM skunits)|28|
#    And I verify the data got updated as needed from DB
#      |expectedColumn|expectedValue|
#      |DB:skunits:brand_id: ORDER BY id DESC LIMIT 1|DB:brands:id: id=1 LIMIT 1|
#      |DB:skunits:category_id: ORDER BY id DESC LIMIT 1|DB:categories:id: id=1 LIMIT 1|
#      |DB:skunits:fordevice: ORDER BY id DESC LIMIT 1|1|

