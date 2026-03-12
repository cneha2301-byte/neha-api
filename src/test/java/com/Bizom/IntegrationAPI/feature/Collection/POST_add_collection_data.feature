@AddCollectionData @all @sanity @Execution

Feature: This feature file is of the testcases of POST API end points of add collection.


###################################################################################################################################################
#                                                       PAYMENT MODE: Cash                                                                        #
###################################################################################################################################################


  @test1 @cash
  Scenario: TC_01 - Add Collection Data - Positive Case - Cash Mode
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "add_collection_cash" payload
      |JPath             |Value|
      |$[0].warehouse_erp_id | DB:warehouses:erp_id:name="SLV DISTRIBUTOR" |
      |$[0].outlet_erp_id     | DB:outlets:erp_id: id=3 |
      |$[0].fordate           | todayDate |
    And I post the request with "add_collection_cash" payload with dynamic access token and query parameters
      |Query       |Value  |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |true           |
      |$.Data[0].reason    |"Collection done successfully."|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "2000" milliseconds


  @test2 @cash
  Scenario: TC_02 - Add Collection Data - Negative Case - Cash - wrong warehouse erp id
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "add_collection_cash" payload
      |JPath             |Value|
      |$[0].warehouse_erp_id | randomInt |
      |$[0].outlet_erp_id     | DB:outlets:erp_id: id=3 |
      |$[0].fordate           | todayDate |
    And I post the request with "add_collection_cash" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false          |
      |$.Reason         |"Unable to process request."             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1500" milliseconds


  @test3 @cash
  # BUG -> Empty Warehouse ERP ID returns collection done successfully.
  Scenario: TC_03 - Add Collection Data - Negative Case - Cash - empty string warehouse erp id
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    When I modify the fields in "add_collection_cash" payload
      |JPath          |Value            |
      |$[0].warehouse_erp_id |        |
    And I post the request with "add_collection_cash" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |true          |
      |$.Reason         |"Warehouse_erp_id can not be empty"             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1800" milliseconds


  @test4 @cash
  # Error -> Remove Warehouse ERP ID field returns cake error, but error validation at the end is right.
  Scenario: TC_04 - Add Collection Data - Negative Case - Cash - remove warehouse erp id field
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I remove the fields from "add_collection_cash" payload
      |JPath                 |
      |$[0].warehouse_erp_id |
    And I post the request with "add_collection_cash" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |true          |
      |$.Reason         |"Warehouse_erp_id can not be empty"             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1500" milliseconds


  @test5 @cash
  Scenario: TC_05 - Add Collection Data - Negative Case - Cash - wrong outlet erp id
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "add_collection_cash" payload
      |JPath             |Value|
      |$[0].warehouse_erp_id | DB:warehouses:erp_id:name="SLV DISTRIBUTOR" |
      |$[0].outlet_erp_id     | randomInt|
      |$[0].fordate           | todayDate |
    And I post the request with "add_collection_cash" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false          |
      |$.Reason         |"Unable to process request."             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1500" milliseconds


  @test6 @cash
  # BUG -> Empty Outlet ERP ID returns collection done successfully.
  Scenario: TC_06 - Add Collection Data - Negative Case - Cash - empty outlet erp id
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    When I modify the fields in "add_collection_cash" payload
      |JPath          |Value            |
      |$[0].outlet_erp_id |        |
    And I post the request with "add_collection_cash" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |true          |
      |$.Reason         |"Outlet_erp_id can not be empty" |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1500" milliseconds


  @test7 @cash
  # Error -> Remove Outlet ERP ID field returns cake error, but error validation at the end is right.
  Scenario: TC_07 - Add Collection Data - Negative Case - Cash - remove outlet erp id field
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I remove the fields from "add_collection_cash" payload
      |JPath              |
      |$[0].outlet_erp_id |
    And I post the request with "add_collection_cash" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |true          |
      |$.Reason         |"Outlet_erp_id can not be empty"             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1500" milliseconds


  @test8 @cash
  # BUG -> Empty Warehouse and Outlet ERP ID returns collection done successfully.
  Scenario: TC_08 - Add Collection Data - Negative Case - Cash - empty warehouse and outlet erp id
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    When I modify the fields in "add_collection_cash" payload
      |JPath          |Value            |
      |$[0].warehouse_erp_id|           |
      |$[0].outlet_erp_id |             |
    And I post the request with "add_collection_cash" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |true          |
      |$.Reason         |"Outlet_erp_id can not be empty"             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1500" milliseconds


  @test9 @cash
  # Error -> Remove Warehouse and Outlet ERP ID returns cake error, but error validation at the end is right.
  Scenario: TC_09 - Add Collection Data - Negative Case - Cash - remove warehouse and outlet erp id field
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I remove the fields from "add_collection_cash" payload
      |JPath              |
      |$[0].outlet_erp_id |
      |$[0].warehouse_erp_id|
    And I post the request with "add_collection_cash" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |true          |
      |$.Reason         |"Outlet_erp_id can not be empty"             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1500" milliseconds


  @test10 @cash
  Scenario: TC_10 - Add Collection Data - Negative Case - Cash - amount zero
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    When I modify the fields in "add_collection_cash" payload
      |JPath          |Value            |
      |$[0].amount|0           |
    And I post the request with "add_collection_cash" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false          |
      |$.Reason         |"Unable to process request."             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "2000" milliseconds


  @test11 @cash
  Scenario: TC_11 - Add Collection Data - Negative Case - Cash - amount negative
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "add_collection_cash" payload
      |JPath             |Value|
      |$[0].warehouse_erp_id | DB:warehouses:erp_id:name="SLV DISTRIBUTOR" |
      |$[0].outlet_erp_id     | DB:outlets:erp_id: id=3|
      |$[0].fordate           | todayDate |
      |$[0].amount|-100           |
    And I post the request with "add_collection_cash" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false          |
      |$.Reason         |"Unable to process request."             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1500" milliseconds


  @test12 @cash
  # Error -> Remove Amount field returns cake error, but error validation at the end is right.
  Scenario: TC_12 - Add Collection Data - Negative Case - Cash - remove amount field
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "add_collection_cash" payload
      |JPath             |Value|
      |$[0].warehouse_erp_id | DB:warehouses:erp_id:name="SLV DISTRIBUTOR" |
      |$[0].outlet_erp_id     | DB:outlets:erp_id: id=3|
      |$[0].fordate           | todayDate |
      |$[0].amount|  |
    And I post the request with "add_collection_cash" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false          |
      |$.Reason         |"Unable to process request."             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1500" milliseconds


  @test13 @cash
  # BUG -> Future date returns collection done successfully.
  Scenario: TC_13 - Add Collection Data - Negative Case - Cash - future for date
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "add_collection_cash" payload
      |JPath             |Value|
      |$[0].warehouse_erp_id | DB:warehouses:erp_id:name="SLV DISTRIBUTOR" |
      |$[0].outlet_erp_id     | DB:outlets:erp_id: id=3 |
      |$[0].fordate           | futureDate:30 |
    And I post the request with "add_collection_cash" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |true          |
      |$.Reason         |"Fordate can not be greater than present date in case of cash or online."|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1500" milliseconds


  @test14 @cash
  # BUG -> Remove fordate field returns collection done successfully, although it is a mandatory field.
  Scenario: TC_14 - Add Collection Data - Negative Case - Cash - remove for date field
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I remove the fields from "add_collection_cash" payload
      |JPath              |
      |$[0].fordate       |
    And I post the request with "add_collection_cash" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |true          |
      |$.Reason         |fordate can not be empty      |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1500" milliseconds


  @test15 @cash
  Scenario: TC_15 - Add Collection Data - Negative Case - Cash - empty mode
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    When I modify the fields in "add_collection_cash" payload
      |JPath          |Value            |
      |$[0].mode   |           |
    And I post the request with "add_collection_cash" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false          |
      |$.Reason         |"Unable to process request."             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1500" milliseconds


  @test16 @cash
  # Error -> Remove mode field returns cake error, but error validation at the end is right.
  Scenario: TC_16 - Add Collection Data - Negative Case - Cash - remove mode field
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I remove the fields from "add_collection_cash" payload
      |JPath              |
      |$[0].mode          |
    And I post the request with "add_collection_cash" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false          |
      |$.Reason         |"Unable to process request."             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1500" milliseconds


  @test17 @cash
  # BUG -> Remove all the fields, but it returns true should return some error.
  Scenario: TC_17 - Add Collection Data - Negative Case - Cash - remove all fields
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I remove the fields from "add_collection_cash" payload
      |JPath                |
      |$[0].warehouse_erp_id|
      |$[0].outlet_erp_id   |
      |$[0].amount          |
      |$[0].fordate         |
      |$[0].mode            |
    And I post the request with "add_collection_cash" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |true          |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1500" milliseconds


###################################################################################################################################################
#                                                       PAYMENT MODE: Check                                                                       #
###################################################################################################################################################



  @test18 @check @testapi
  Scenario: TC_18 - Add Collection Data - Positive Case - Check Mode
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "add_collection_check" payload
      |JPath             |Value|
      |$[0].warehouse_erp_id | DB:warehouses:erp_id:name="SLV DISTRIBUTOR" |
      |$[0].outlet_erp_id     | DB:outlets:erp_id: id=3 |
      |$[0].fordate           | todayDate |
      |$[0].Check.checkno     |  randomDouble  |
      |$[0].Check.bankname    |  DB:checks:bankname:id=17   |
      |$[0].Check.checkdate   |     todayDate      |
    And I post the request with "add_collection_check" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |true           |
      |$.Data[0].reason    |"Collection done successfully."|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1500" milliseconds


  @test19 @check
  Scenario: TC_19 - Add Collection Data - Negative Case - Check - wrong warehouse erp id
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "add_collection_check" payload
      |JPath             |Value|
      |$[0].warehouse_erp_id | randomInt|
      |$[0].outlet_erp_id     | DB:outlets:erp_id: id=3 |
      |$[0].fordate           | todayDate |
      |$[0].Check.checkno     |  randomDouble  |
      |$[0].Check.bankname    |  DB:checks:bankname:id=17   |
      |$[0].Check.checkdate   |     todayDate      |
    And I post the request with "add_collection_check" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false          |
      |$.Reason         |"Unable to process request."             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1500" milliseconds


  @test20 @check
  # BUG -> Empty Warehouse ERP ID returns collection done successfully.
  Scenario: TC_20 - Add Collection Data - Negative Case - Check - empty string warehouse erp id
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    When I modify the fields in "add_collection_check" payload
      |JPath          |Value            |
      |$[0].warehouse_erp_id |        |
    And I post the request with "add_collection_check" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |true          |
      |$.Reason         |"Warehouse_erp_id can not be empty"             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1500" milliseconds


  @test21 @check
  # Error -> Remove Warehouse ERP ID returns cake error, but error validation at the end is right.
  Scenario: TC_21 - Add Collection Data - Negative Case - Check - remove warehouse erp id field
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I remove the fields from "add_collection_check" payload
      |JPath                 |
      |$[0].warehouse_erp_id |
    And I post the request with "add_collection_check" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |true          |
      |$.Reason         |"Warehouse_erp_id can not be empty"             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1500" milliseconds


  @test22 @check
  Scenario: TC_22 - Add Collection Data - Negative Case - Check - wrong outlet erp id
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "add_collection_check" payload
      |JPath             |Value|
      |$[0].warehouse_erp_id | DB:warehouses:erp_id:name="SLV DISTRIBUTOR"|
      |$[0].outlet_erp_id     | randomInt|
      |$[0].fordate           | todayDate |
      |$[0].Check.checkno     |  randomDouble  |
      |$[0].Check.bankname    |  DB:checks:bankname:id=17   |
      |$[0].Check.checkdate   |     todayDate      |
    And I post the request with "add_collection_check" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false          |
      |$.Reason         |"Unable to process request."             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1500" milliseconds


  @test23 @check
  # BUG -> Empty Outlet ERP ID returns collection done successfully.
  Scenario: TC_23 - Add Collection Data - Negative Case - Check - empty outlet erp id
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "add_collection_check" payload
      |JPath             |Value|
      |$[0].warehouse_erp_id | DB:warehouses:erp_id:name="SLV DISTRIBUTOR"|
      |$[0].outlet_erp_id     | |
      |$[0].fordate           | todayDate |
      |$[0].Check.checkno     |  randomDouble  |
      |$[0].Check.bankname    |  DB:checks:bankname:id=17   |
      |$[0].Check.checkdate   |     todayDate      |
    And I post the request with "add_collection_check" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |true          |
      |$.Reason         |"Outlet_erp_id can not be empty"             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "2500" milliseconds


  @test24 @check
  # Error -> Remove Outlet ERP ID returns cake error, but error validation at the end is right.
  Scenario: TC_24 - Add Collection Data - Negative Case - Check - remove outlet erp id field
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I remove the fields from "add_collection_check" payload
      |JPath                 |
      |$[0].outlet_erp_id |
    And I post the request with "add_collection_check" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |true          |
      |$.Reason         |"Outlet_erp_id can not be empty"             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1500" milliseconds


  @test25 @check
  # BUG -> Empty Warehouse and Outlet ERP ID returns collection done successfully.
  Scenario: TC_25 - Add Collection Data - Negative Case - Check - empty warehouse and outlet erp id
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    When I modify the fields in "add_collection_check" payload
      |JPath          |Value            |
      |$[0].warehouse_erp_id|           |
      |$[0].outlet_erp_id |             |
    And I post the request with "add_collection_check" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |true          |
      |$.Reason         |"Outlet_erp_id can not be empty"|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "2500" milliseconds


  @test26 @check
  # Error -> Remove Warehouse and Outlet ERP ID returns cake error, but error validation at the end is right.
  Scenario: TC_26 - Add Collection Data - Negative Case - Cash - remove warehouse and outlet erp id field
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I remove the fields from "add_collection_check" payload
      |JPath              |
      |$[0].outlet_erp_id |
      |$[0].warehouse_erp_id|
    And I post the request with "add_collection_check" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |true          |
      |$.Reason         |"Outlet_erp_id can not be empty"             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1500" milliseconds


  @test27 @check
  Scenario: TC_27 - Add Collection Data - Negative Case - Check - amount zero
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    When I modify the fields in "add_collection_check" payload
      |JPath          |Value            |
      |$[0].amount|0           |
    And I post the request with "add_collection_check" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false          |
      |$.Reason         |"Unable to process request."             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "2500" milliseconds


  @test28 @check
  Scenario: TC_28 - Add Collection Data - Negative Case - Check - amount negative
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "add_collection_check" payload
      |JPath             |Value|
      |$[0].warehouse_erp_id | DB:warehouses:erp_id:name="SLV DISTRIBUTOR"|
      |$[0].outlet_erp_id     |DB:outlets:erp_id: id=3 |
      |$[0].fordate           | todayDate |
      |$[0].Check.checkno     |  randomDouble  |
      |$[0].Check.bankname    |  DB:checks:bankname:id=17   |
      |$[0].Check.checkdate   |     todayDate      |
      |$[0].amount|-100           |
    And I post the request with "add_collection_check" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false          |
      |$.Reason         |"Unable to process request."             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1500" milliseconds


  @test29 @check
  # Error -> Remove Amount field returns cake error, but error validation at the end is right.
  Scenario: TC_29 - Add Collection Data - Negative Case - Check - remove amount field
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "add_collection_check" payload
      |JPath             |Value|
      |$[0].warehouse_erp_id | DB:warehouses:erp_id:name="SLV DISTRIBUTOR"|
      |$[0].outlet_erp_id     |DB:outlets:erp_id: id=3 |
      |$[0].fordate           | todayDate |
      |$[0].Check.checkno     |  randomDouble  |
      |$[0].Check.bankname    |  DB:checks:bankname:id=17   |
      |$[0].Check.checkdate   |     todayDate      |
      |$[0].amount|         |
    And I post the request with "add_collection_check" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false          |
      |$.Reason         |"Unable to process request."             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1500" milliseconds


  @test30 @check
  # BUG -> Future date returns collection done successfully.
  Scenario: TC_30 - Add Collection Data - Negative Case - Check - future for date
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "add_collection_check" payload
      |JPath             |Value|
      |$[0].warehouse_erp_id | DB:warehouses:erp_id:name="SLV DISTRIBUTOR"|
      |$[0].outlet_erp_id     | DB:outlets:erp_id: id=3|
      |$[0].fordate           | futureDate:30 |
      |$[0].Check.checkno     |  randomDouble  |
      |$[0].Check.bankname    |  DB:checks:bankname:id=17   |
      |$[0].Check.checkdate   |     todayDate      |
    And I post the request with "add_collection_check" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |true          |
      |$.Data[0].reason         |"Collection done successfully."             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1500" milliseconds


  @test31 @check
  # BUG -> Remove fordate field returns collection done successfully, although it is a mandatory field.
  Scenario: TC_31 - Add Collection Data - Negative Case - Cash - remove for date field
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I remove the fields from "add_collection_check" payload
      |JPath              |
      |$[0].fordate       |
    And I post the request with "add_collection_check" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |true          |
      |$.Reason         |fordate can not be empty      |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "2500" milliseconds


  @test32 @check
  Scenario: TC_32 - Add Collection Data - Negative Case - Check - empty mode
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    When I modify the fields in "add_collection_check" payload
      |JPath          |Value            |
      |$[0].mode   |           |
    And I post the request with "add_collection_check" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false          |
      |$.Reason         |"Unable to process request."             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1500" milliseconds


  @test33 @check
  # Error -> Remove mode field returns cake error, but error validation at the end is right.
  Scenario: TC_33 - Add Collection Data - Negative Case - Check - remove mode field
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I remove the fields from "add_collection_check" payload
      |JPath              |
      |$[0].mode          |
    And I post the request with "add_collection_check" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false          |
      |$.Reason         |"Unable to process request."             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1500" milliseconds


  @test34 @check
  Scenario: TC_34 - Add Collection Data - Negative Case - Check - empty check no
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "add_collection_check" payload
      |JPath             |Value|
      |$[0].warehouse_erp_id | DB:warehouses:erp_id:name="SLV DISTRIBUTOR" |
      |$[0].outlet_erp_id     | DB:outlets:erp_id: id=3 |
      |$[0].fordate           | todayDate |
      |$[0].Check.checkno     |    |
      |$[0].Check.bankname    |  DB:checks:bankname:id=17   |
      |$[0].Check.checkdate   |     todayDate      |
    And I post the request with "add_collection_check" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false          |
      |$.Reason         |"Unable to process request."             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "2500" milliseconds


  @test35 @check
  Scenario: TC_35 - Add Collection Data - Negative Case - Check - remove check no field
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    When I remove the fields from "add_collection_check" payload
      |JPath                |
      |$[0].Check.checkno   |
    And I post the request with "add_collection_check" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false          |
      |$.Reason         |"Unable to process request."             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1500" milliseconds


  @test36 @check
  Scenario: TC_36 - Add Collection Data - Negative Case - Check - empty bank name
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "add_collection_check" payload
      |JPath             |Value|
      |$[0].warehouse_erp_id | DB:warehouses:erp_id:name="SLV DISTRIBUTOR" |
      |$[0].outlet_erp_id     | DB:outlets:erp_id: id=3 |
      |$[0].fordate           | todayDate |
      |$[0].Check.checkno     |  randomDouble  |
      |$[0].Check.bankname    |     |
      |$[0].Check.checkdate   |     todayDate      |
    And I post the request with "add_collection_check" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false          |
      |$.Reason         |"Unable to process request."             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1500" milliseconds


  @test37 @check
  Scenario: TC_37 - Add Collection Data - Negative Case - Check - remove bank name field
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    When I remove the fields from "add_collection_check" payload
      |JPath                 |
      |$[0].Check.bankname   |
    And I post the request with "add_collection_check" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false          |
      |$.Reason         |"Unable to process request."             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1500" milliseconds


  @test38 @check
  Scenario: TC_38 - Add Collection Data - Negative Case - Check - empty check date
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "add_collection_check" payload
      |JPath             |Value|
      |$[0].warehouse_erp_id | DB:warehouses:erp_id:name="SLV DISTRIBUTOR" |
      |$[0].outlet_erp_id     | DB:outlets:erp_id: id=3 |
      |$[0].fordate           | todayDate |
      |$[0].Check.checkno     |  randomDouble  |
      |$[0].Check.bankname    |  DB:checks:bankname:id=17   |
      |$[0].Check.checkdate   |           |
    And I post the request with "add_collection_check" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false          |
      |$.Reason         |"Unable to process request."             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1500" milliseconds


  @test39 @check
  Scenario: TC_39 - Add Collection Data - Negative Case - Check - remove check date field
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    When I remove the fields from "add_collection_check" payload
      |JPath                  |
      |$[0].Check.checkdate   |
    And I post the request with "add_collection_check" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false          |
      |$.Reason         |"Unable to process request."             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1500" milliseconds


  @test40 @check
  Scenario: TC_40 - Add Collection Data - Negative Case - Check - empty checkno, bankname and checkdate
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "add_collection_check" payload
      |JPath             |Value|
      |$[0].warehouse_erp_id | DB:warehouses:erp_id:name="SLV DISTRIBUTOR" |
      |$[0].outlet_erp_id     | DB:outlets:erp_id: id=3 |
      |$[0].fordate           | todayDate |
      |$[0].Check.checkno     |     |
      |$[0].Check.bankname    |     |
      |$[0].Check.checkdate   |     |
    And I post the request with "add_collection_check" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false          |
      |$.Reason         |"Unable to process request."             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "2500" milliseconds


  @test41 @check
  Scenario: TC_41 - Add Collection Data - Negative Case - Check - remove checkno, bankname and checkdate field
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    When I remove the fields from "add_collection_check" payload
      |JPath                  |Value      |
      |$[0].Check.checkno     |           |
      |$[0].Check.bankname    |           |
      |$[0].Check.checkdate   |           |
    And I post the request with "add_collection_check" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false          |
      |$.Reason         |"Unable to process request."             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "1500" milliseconds


###################################################################################################################################################
#                                                       PAYMENT MODE: Online                                                                      #
###################################################################################################################################################


  @test42 @online
  Scenario: TC_42 - Add Collection Data - Positive Case - Online Mode
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "add_collection_online" payload
      |JPath             |Value|
      |$[0].warehouse_erp_id | DB:warehouses:erp_id:name="SLV DISTRIBUTOR" |
      |$[0].outlet_erp_id     | DB:outlets:erp_id: id=3 |
      |$[0].fordate           | todayDate |
      |$[0].Onlinetransaction.transactionid     |  randomDouble  |
      |$[0].Onlinetransaction.bankname    |  DB:onlinetransactions:bankname:id=3   |
      |$[0].Onlinetransaction.date   |  todayDate      |
    And I post the request with "add_collection_online" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |true           |
      |$.Data[0].reason         |"Collection done successfully."|
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "3000" milliseconds


  @test43 @online
  Scenario: TC_43 - Add Collection Data - Negative Case - Online - wrong warehouse erp id
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "add_collection_online" payload
      |JPath             |Value|
      |$[0].warehouse_erp_id | randomaInt|
      |$[0].outlet_erp_id     | DB:outlets:erp_id: id=3 |
      |$[0].fordate           | todayDate |
      |$[0].Onlinetransaction.transactionid     |  randomDouble  |
      |$[0].Onlinetransaction.bankname    |  DB:onlinetransactions:bankname:id=3   |
      |$[0].Onlinetransaction.date   |  todayDate      |
    And I post the request with "add_collection_online" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false          |
      |$.Reason         |"Unable to process request."             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "3000" milliseconds


  @test44 @online
  # BUG -> Empty Warehouse ERP ID returns collection done successfully.
  Scenario: TC_44 - Add Collection Data - Negative Case - Online - empty string warehouse erp id
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "add_collection_online" payload
      |JPath             |Value|
      |$[0].warehouse_erp_id | |
      |$[0].outlet_erp_id     | DB:outlets:erp_id: id=3 |
      |$[0].fordate           | todayDate |
      |$[0].Onlinetransaction.transactionid     |  randomDouble  |
      |$[0].Onlinetransaction.bankname    |  DB:onlinetransactions:bankname:id=3   |
      |$[0].Onlinetransaction.date   |  todayDate      |
    And I post the request with "add_collection_online" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |true          |
      |$.Reason         |"Warehouse_erp_id can not be empty"             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "3000" milliseconds


  @test45 @online
  # Error -> Remove Warehouse ERP ID field returns cake error, but error validation at the end is right.
  Scenario: TC_45 - Add Collection Data - Negative Case - Online - remove warehouse erp id field
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "add_collection_online" payload
      |JPath          |Value            |
      |$[0].warehouse_erp_id |        |
      |$[0].Onlinetransaction.transactionid|randomDouble  |
    And I post the request with "add_collection_online" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |true          |
      |$.Reason         |"Warehouse_erp_id can not be empty"             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "3000" milliseconds


  @test46 @online
  Scenario: TC_46 - Add Collection Data - Negative Case - Online - wrong outlet erp id
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "add_collection_online" payload
      |JPath             |Value|
      |$[0].warehouse_erp_id | DB:warehouses:erp_id:name="SLV DISTRIBUTOR" |
      |$[0].outlet_erp_id     | randomInt|
      |$[0].fordate           | todayDate |
      |$[0].Onlinetransaction.transactionid     |  randomDouble  |
      |$[0].Onlinetransaction.bankname    |  DB:onlinetransactions:bankname:id=3   |
      |$[0].Onlinetransaction.date   |  todayDate      |
    And I post the request with "add_collection_online" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false          |
      |$.Reason         |"Unable to process request."             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "3000" milliseconds


  @test47 @online
  # BUG -> Empty Outlet ERP ID returns collection done successfully.
  Scenario: TC_47 - Add Collection Data - Negative Case - Online - empty outlet erp id
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "add_collection_online" payload
      |JPath             |Value|
      |$[0].warehouse_erp_id | DB:warehouses:erp_id:name="SLV DISTRIBUTOR" |
      |$[0].outlet_erp_id     |  |
      |$[0].fordate           | todayDate |
      |$[0].Onlinetransaction.transactionid     |  randomDouble  |
      |$[0].Onlinetransaction.bankname    |  DB:onlinetransactions:bankname:id=3   |
      |$[0].Onlinetransaction.date   |  todayDate      |
    And I post the request with "add_collection_online" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |true          |
      |$.Reason         |"Outlet_erp_id can not be empty"             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "3000" milliseconds


  @test48 @online
  # Error -> Remove Warehouse ERP ID field returns cake error, but error validation at the end is right.
  Scenario: TC_48 - Add Collection Data - Negative Case - Online - remove outlet erp id field
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "add_collection_online" payload
      |JPath             |Value|
      |$[0].warehouse_erp_id | DB:warehouses:erp_id:name="SLV DISTRIBUTOR" |
      |$[0].outlet_erp_id     |  |
      |$[0].fordate           | todayDate |
      |$[0].Onlinetransaction.transactionid     |  randomDouble  |
      |$[0].Onlinetransaction.bankname    |  DB:onlinetransactions:bankname:id=3   |
      |$[0].Onlinetransaction.date   |  todayDate      |
    And I post the request with "add_collection_online" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |true          |
      |$.Reason         |"Outlet_erp_id can not be empty"             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "3000" milliseconds


  @test49 @online
  Scenario: TC_49 - Add Collection Data - Negative Case - Online - empty warehouse and outlet erp id
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "add_collection_online" payload
      |JPath             |Value|
      |$[0].warehouse_erp_id |  |
      |$[0].outlet_erp_id     |  |
      |$[0].fordate           | todayDate |
      |$[0].Onlinetransaction.transactionid     |  randomDouble  |
      |$[0].Onlinetransaction.bankname    |  DB:onlinetransactions:bankname:id=3   |
      |$[0].Onlinetransaction.date   |  todayDate      |
    And I post the request with "add_collection_online" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |true          |
      |$.Reason         |"Outlet_erp_id can not be empty"             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "3000" milliseconds


  @test50 @online
  # Error -> Remove Warehouse and Outlet ERP ID field returns cake error, but error validation at the end is right.
  Scenario: TC_50 - Add Collection Data - Negative Case - Online - remove warehouse and outlet erp id field
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "add_collection_online" payload
      |JPath          |Value            |
      |$[0].warehouse_erp_id |          |
      |$[0].outlet_erp_id    |          |
      |$[0].Onlinetransaction.transactionid|randomInt  |
    And I post the request with "add_collection_online" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |true          |
      |$.Reason         |"Outlet_erp_id can not be empty"             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "3000" milliseconds


  @test51 @online
  Scenario: TC_51 - Add Collection Data - Negative Case - Online - amount zero
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "add_collection_online" payload
      |JPath             |Value|
      |$[0].warehouse_erp_id | DB:warehouses:erp_id:name="SLV DISTRIBUTOR" |
      |$[0].outlet_erp_id     | DB:outlets:erp_id: id=3 |
      |$[0].fordate           | todayDate |
      |$[0].amount|0           |
      |$[0].Onlinetransaction.transactionid     |  randomDouble  |
      |$[0].Onlinetransaction.bankname    |  DB:onlinetransactions:bankname:id=3   |
      |$[0].Onlinetransaction.date   |  todayDate      |
    And I post the request with "add_collection_online" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false          |
      |$.Reason         |"Unable to process request."             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "3000" milliseconds


  @test52 @online
  Scenario: TC_52 - Add Collection Data - Negative Case - Online - amount negative
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "add_collection_online" payload
      |JPath             |Value|
      |$[0].warehouse_erp_id | DB:warehouses:erp_id:name="SLV DISTRIBUTOR" |
      |$[0].outlet_erp_id     | DB:outlets:erp_id: id=3 |
      |$[0].fordate           | todayDate |
      |$[0].amount|-100           |
      |$[0].Onlinetransaction.transactionid     |  randomDouble  |
      |$[0].Onlinetransaction.bankname    |  DB:onlinetransactions:bankname:id=3   |
      |$[0].Onlinetransaction.date   |  todayDate      |
    And I post the request with "add_collection_online" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false          |
      |$.Reason         |"Unable to process request."             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "3000" milliseconds


  @test53 @online
  # Error -> Remove Amount field returns cake error, but error validation at the end is right.
  Scenario: TC_53 - Add Collection Data - Negative Case - Online - remove amount field
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "add_collection_online" payload
      |JPath             |Value|
      |$[0].warehouse_erp_id | DB:warehouses:erp_id:name="SLV DISTRIBUTOR" |
      |$[0].outlet_erp_id     | DB:outlets:erp_id: id=3 |
      |$[0].fordate           | todayDate |
      |$[0].amount||
      |$[0].Onlinetransaction.transactionid     |  randomDouble  |
      |$[0].Onlinetransaction.bankname    |  DB:onlinetransactions:bankname:id=3   |
      |$[0].Onlinetransaction.date   |  todayDate      |
    And I post the request with "add_collection_online" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false          |
      |$.Reason         |Unable to process request.  |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "3000" milliseconds


  @test54 @online
  # BUG -> Future date returns collection done successfully.
  Scenario: TC_54 - Add Collection Data - Negative Case - Online - future for date
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "add_collection_online" payload
      |JPath             |Value|
      |$[0].warehouse_erp_id | DB:warehouses:erp_id:name="SLV DISTRIBUTOR" |
      |$[0].outlet_erp_id     | DB:outlets:erp_id: id=3 |
      |$[0].fordate           | futureDate:30 |
      |$[0].amount|50           |
      |$[0].Onlinetransaction.transactionid     |  randomDouble  |
      |$[0].Onlinetransaction.bankname    |  DB:onlinetransactions:bankname:id=3   |
      |$[0].Onlinetransaction.date   |  todayDate      |
    And I post the request with "add_collection_online" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |true          |
      |$.Reason         |"Fordate can not be greater than present date in case of cash or online." |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "3000" milliseconds


  @test55 @online
  # Error -> Remove For Date field returns cake error, but error validation at the end is right.
  Scenario: TC_55 - Add Collection Data - Negative Case - Online - remove for date field
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "add_collection_online" payload
      |JPath             |Value|
      |$[0].warehouse_erp_id | DB:warehouses:erp_id:name="SLV DISTRIBUTOR" |
      |$[0].outlet_erp_id     | DB:outlets:erp_id: id=3 |
      |$[0].fordate           |  |
      |$[0].amount|50          |
      |$[0].Onlinetransaction.transactionid     |  randomDouble  |
      |$[0].Onlinetransaction.bankname    |  DB:onlinetransactions:bankname:id=3   |
      |$[0].Onlinetransaction.date   |  todayDate      |
    And I post the request with "add_collection_online" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |true          |
      |$.Reason         |fordate can not be empty      |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "3000" milliseconds


  @test56 @online
  Scenario: TC_56 - Add Collection Data - Negative Case - Online - empty mode
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "add_collection_online" payload
      |JPath             |Value|
      |$[0].warehouse_erp_id | DB:warehouses:erp_id:name="SLV DISTRIBUTOR" |
      |$[0].outlet_erp_id     | DB:outlets:erp_id: id=3 |
      |$[0].fordate           | todayDate |
      |$[0].Onlinetransaction.transactionid     |  randomDouble  |
      |$[0].Onlinetransaction.bankname    |  DB:onlinetransactions:bankname:id=3   |
      |$[0].Onlinetransaction.date   |  todayDate      |
      |$[0].mode   |           |
    And I post the request with "add_collection_online" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false          |
      |$.Reason         |"Unable to process request."             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "3000" milliseconds


  @test57 @online
  # Error -> Remove Warehouse ERP ID field returns cake error, but error validation at the end is right.
  Scenario: TC_57 - Add Collection Data - Negative Case - Online - remove mode field
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "add_collection_online" payload
      |JPath          |Value            |
      |$[0].mode |        |
      |$[0].Onlinetransaction.transactionid|randomDouble  |
    And I post the request with "add_collection_online" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false          |
      |$.Reason         |"Unable to process request."             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "3000" milliseconds


  @test58 @online
  Scenario: TC_58 - Add Collection Data - Negative Case - Online - empty transaction id
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "add_collection_online" payload
      |JPath             |Value|
      |$[0].warehouse_erp_id | DB:warehouses:erp_id:name="SLV DISTRIBUTOR" |
      |$[0].outlet_erp_id     | DB:outlets:erp_id: id=3 |
      |$[0].fordate           | todayDate |
      |$[0].Onlinetransaction.transactionid     |    |
      |$[0].Onlinetransaction.bankname    |  DB:onlinetransactions:bankname:id=3   |
      |$[0].Onlinetransaction.date   |  todayDate      |
    And I post the request with "add_collection_online" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false          |
      |$.Reason         |"Unable to process request."             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "3000" milliseconds


  @test59 @online
  # Error -> Remove Transaction ID field returns cake error, but error validation at the end is right.
  Scenario: TC_59 - Add Collection Data - Negative Case - Online - remove transaction id field
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I remove the fields from "add_collection_online" payload
      |JPath                                |
      |$[0].Onlinetransaction.transactionid |
    And I post the request with "add_collection_online" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false          |
      |$.Reason         |"Unable to process request."             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "3000" milliseconds


  @test60 @online
  Scenario: TC_60 - Add Collection Data - Negative Case - Online - empty bank name
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "add_collection_online" payload
      |JPath             |Value|
      |$[0].warehouse_erp_id | DB:warehouses:erp_id:name="SLV DISTRIBUTOR" |
      |$[0].outlet_erp_id     | DB:outlets:erp_id: id=3 |
      |$[0].fordate           | todayDate |
      |$[0].Onlinetransaction.transactionid     |  randomDouble  |
      |$[0].Onlinetransaction.bankname    |    |
      |$[0].Onlinetransaction.date   |  todayDate      |
    And I post the request with "add_collection_check" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false          |
      |$.Reason         |"Unable to process request."             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "3000" milliseconds


  @test61 @online
  # Error -> Remove Bankname field returns cake error, but error validation at the end is right.
  Scenario: TC_61 - Add Collection Data - Negative Case - Online - remove bank name field
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "add_collection_online" payload
      |JPath                               |Value   |
      |$[0].Onlinetransaction.bankname     |        |
      |$[0].Onlinetransaction.transactionid|randomDouble  |
    And I post the request with "add_collection_online" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false          |
      |$.Reason         |"Unable to process request."             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "3000" milliseconds


  @test62 @online
  Scenario: TC_62 - Add Collection Data - Negative Case - Online - empty date
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with values and fields with random values in "add_collection_online" payload
      |JPath            |Value                     |
      |$[0].Onlinetransaction.transactionid|random |
      |$[0].Onlinetransaction.date   |           |
    And I post the request with "add_collection_online" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false          |
      |$.Reason         |"Unable to process request."             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "3000" milliseconds


  @test63 @online
  # Error -> Remove Date field returns cake error, but error validation at the end is right.
  Scenario: TC_63 - Add Collection Data - Negative Case - Online - remove date field
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "add_collection_online" payload
      |JPath                               |Value   |
      |$[0].Onlinetransaction.date         |        |
      |$[0].Onlinetransaction.transactionid|randomDouble  |
    And I post the request with "add_collection_online" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false          |
      |$.Reason         |"Unable to process request."             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "3000" milliseconds


  @test64 @online
  Scenario: TC_64 - Add Collection Data - Negative Case - Check - empty transactionid, bankname and date
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with values and fields with random values in "add_collection_online" payload
      |JPath            |Value                     |
      |$[0].Onlinetransaction.transactionid|random |
      |$[0].Onlinetransaction.transactionid     |           |
      |$[0].Onlinetransaction.bankname    |           |
      |$[0].Onlinetransaction.date  |           |
    And I post the request with "add_collection_check" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false          |
      |$.Reason         |"Unable to process request."             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "3000" milliseconds


  @test65 @online
  # Error -> Remove Transaction ID, Bankname, Date field returns cake error, but error validation at the end is right.
  Scenario: TC_65 - Add Collection Data - Negative Case - Online - remove transaction id, bank name, date field
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |Content-Type|application/json|
    And I modify fields with random values and remove fields in "add_collection_online" payload
      |JPath                               |Value   |
      |$[0].Onlinetransaction.transactionid|        |
      |$[0].Onlinetransaction.bankname     |        |
      |$[0].Onlinetransaction.date         |        |
      |$[0].Onlinetransaction.transactionid|randomDouble  |
    And I post the request with "add_collection_online" payload with dynamic access token and query parameters
      |Query       |Value                        |
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath            |Value          |
      |$.Result         |false          |
      |$.Reason         |"Unable to process request."             |
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And verify response time is less than "3000" milliseconds