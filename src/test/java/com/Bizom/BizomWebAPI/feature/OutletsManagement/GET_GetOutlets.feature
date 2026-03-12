@BizomWebAPI @CE @OutletsManagement @GetOutlets @InventoryOperations
Feature: Get Outlets API Testing
  As a system user
  I want to test the get outlets endpoint
  So that I can validate outlet retrieval across date ranges and filters

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|*/*|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|

  @Negative @Security
  Scenario: TC_01 Get outlets without access token
    When I send the GET request to "list_outlets" endpoint with query and path parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |datetype|modified|fromdate|2024-01-01|
      | | |todate|2026-01-09|
      | | |startseq|1000|
      | | |endseq|1919|
      | | |warehouse_id|null|
      | | |responsetype|null|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "3000" milliseconds

  @Negative @Security
  Scenario: TC_02 Get outlets with invalid access token
    And I send the GET request to "list_outlets" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|invalid_token_12345|fromdate|2024-01-01|
      |datetype|modified|todate|2026-01-09|
      | | |startseq|1000|
      | | |endseq|1919|
      | | |warehouse_id|null|
      | | |responsetype|null|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "3000" milliseconds

  @Negative @Security
  Scenario: TC_03 Get outlets with expired access token
    And I send the GET request to "list_outlets" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|expired_token_12345|fromdate|2024-01-01|
      |datetype|modified|todate|2026-01-09|
      | | |startseq|1000|
      | | |endseq|1919|
      | | |warehouse_id|null|
      | | |responsetype|null|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "3000" milliseconds

  @Positive @Smoke
  Scenario: TC_04 Get outlets for date range with valid access token
    And I send the GET request to "list_outlets" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2024-01-01|
      |datetype|modified|todate|2026-01-09|
      | | |startseq|1000|
      | | |endseq|1919|
      | | |warehouse_id|null|
      | | |responsetype|null|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.Result|false|
      |$.Reason|"No Data Found"|
      |$.result|false|
      |$.reason|"No Data Found"|
    And verifies the list is empty
      |JPath|
      |$.Outlet|
    And I store the response as "get_outlets_no_data" name using full path

  @Positive @DataValidation
  Scenario: TC_05 Validate get outlets response structure
    And I send the GET request to "list_outlets" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2024-01-01|
      |datetype|modified|todate|2026-01-09|
      | | |startseq|1000|
      | | |endseq|1919|
      | | |warehouse_id|null|
      | | |responsetype|null|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|boolean|
      |$.Reason|string|
      |$.Outlet|array|

  @Positive @ContentValidation
  Scenario: TC_06 Validate get outlets response contains expected keys
    And I send the GET request to "list_outlets" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2024-01-01|
      |datetype|modified|todate|2026-01-09|
      | | |startseq|1000|
      | | |endseq|1919|
      | | |warehouse_id|null|
      | | |responsetype|null|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And validating the response contains the following values
      |Value|
      |Result|
      |Reason|
      |Outlet|

  @Negative @Validation
  Scenario: TC_07 Get outlets with invalid date format
    And I send the GET request to "list_outlets" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|invalid-date|
      |datetype|modified|todate|2026-01-09|
      | | |startseq|1000|
      | | |endseq|1919|
      | | |warehouse_id|null|
      | | |responsetype|null|
    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds

  @Positive @Regression @GetOutlets
  Scenario: TC_08 Regression validation for different data windows
    And I send the GET request to "list_outlets" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2023-01-01|
      |datetype|created|todate|2023-12-31|
      | | |startseq|1000|
      | | |endseq|1919|
      | | |warehouse_id|null|
      | | |responsetype|null|

    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
      |$.reason|"No Data Found"|

    # Examples:
    #   |fromdate   |todate     |datetype |
    #   |2024-01-01 |2026-01-09 |modified |
    #   |2023-01-01 |2023-12-31 |created  |

  @Positive @Performance
  Scenario: TC_09 Performance test for get outlets endpoint
    And I send the GET request to "list_outlets" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2024-01-01|
      |datetype|modified|todate|2026-01-09|
      | | |startseq|1000|
      | | |endseq|1919|
      | | |warehouse_id|null|
      | | |responsetype|null|

    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds

  @Positive @LoadTesting
  Scenario: TC_10 Load testing for get outlets endpoint
    And I send the GET request to "list_outlets" endpoint with dynamic access token, path and query parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |access_token|ACCESS_TOKEN|fromdate|2024-01-01|
      |datetype|modified|todate|2026-01-09|
      | | |startseq|1000|
      | | |endseq|1919|
      | | |warehouse_id|null|
      | | |responsetype|null|

    Then I should see the response code as "200"
    And verify response time is less than "3000" milliseconds


  Scenario: TC_11 Get outlets with KYC status as string value
    When I send the GET request to "list_Outlets" endpoint with query and path parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |datetype|modified|fromdate|2026-01-01|
      | | |todate|2027-01-22|
      | | |startseq|0|
      | | |endseq|500|
      | | |responsetype|json|
      | | |outlet_ids|721|
      | | |warehouse_id|0|
      | | |access_token|ACCESS_TOKEN|

    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.kycStatus|string|

  Scenario: TC_12 Get outlets with KYC status as Status value
    When I send the GET request to "list_Outlets" endpoint with query and path parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |datetype|modified|fromdate|2026-01-01|
      | | |todate|2027-01-22|
      | | |startseq|0|
      | | |endseq|500|
      | | |responsetype|json|
      | | |outlet_ids|721|
      | | |warehouse_id|0|
      | | |access_token|ACCESS_TOKEN|

    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.kycStatus|Incomplete|

  Scenario: TC_13 Get outlets with KYC status as string value
    When I send the GET request to "list_Outlets" endpoint with query and path parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |datetype|modified|fromdate|2026-01-01|
      | | |todate|2027-01-22|
      | | |startseq|0|
      | | |endseq|500|
      | | |responsetype|json|
      | | |outlet_ids|721|
      | | |warehouse_id|0|
      | | |access_token|ACCESS_TOKEN|

    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.kycStatus|Incomplete|
      |$.outletKycStatus|3|


  Scenario: TC_14 Get outlets with outlet KYC status as string value
    When I send the GET request to "list_Outlets" endpoint with query and path parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |datetype|modified|fromdate|2026-01-01|
      | | |todate|2027-01-22|
      | | |startseq|0|
      | | |endseq|500|
      | | |responsetype|json|
      | | |outlet_ids|721|
      | | |warehouse_id|0|
      | | |access_token|ACCESS_TOKEN|

    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.outletKycStatus|string|

  Scenario: TC_15 Get outlets with no data with KYC with using oulet id
    When I send the GET request to "list_Outlets" endpoint with query and path parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |datetype|modified|fromdate|2026-01-01|
      | | |todate|2027-01-22|
      | | |startseq|0|
      | | |endseq|500|
      | | |responsetype|json|
      | | |outlet_ids|720|
      | | |warehouse_id|0|
      | | |access_token|ACCESS_TOKEN|


    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|false|
      |$.Reason|No Data Found|

  Scenario: TC_16 Get outlets with outlet KYC status as string value [3] [here 3 is incomplete status id which will not change]
    When I send the GET request to "list_Outlets" endpoint with query and path parameters
      |QueryParamName|QueryParamValue|Path|Value|
      |datetype|modified|fromdate|2026-01-01|
      | | |todate|2027-01-22|
      | | |startseq|0|
      | | |endseq|500|
      | | |responsetype|json|
      | | |outlet_ids|721|
      | | |warehouse_id|0|
      | | |access_token|ACCESS_TOKEN|

    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "3000" milliseconds
    And validating the response field data types
      |JPath|ExpectedType|
      |$.Result|string|
      |$.Reason|string|
      |$.outletKycStatus|3|



