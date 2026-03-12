@BizomWebAPI @CE @UsersManagement@SystemIntegration
Feature: Get Outlet Balance API Testing
  As a system user
  I want to test the getoutletbalance endpoint
  So that I can ensure proper functionality and data retrieval for outlet balance

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |accept-language|en-US,en;q=0.9|
      |cache-control|max-age=0|
      |priority|u=0, i|
      |sec-ch-ua|"Google Chrome";v="143", "Chromium";v="143", "Not A(Brand";v="24"|
      |sec-ch-ua-mobile|?0|
      |sec-ch-ua-platform|"Windows"|
      |sec-fetch-dest|document|
      |sec-fetch-mode|navigate|
      |sec-fetch-site|none|
      |sec-fetch-user|?1|
      |upgrade-insecure-requests|1|
      |user-agent|Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36|
      |cookie|toolbarDisplay=hide; language=en; CAKEPHP=esou8jdtagil7rtldatmc8pdiu; PHPSESSID=esou8jdtagil7rtldatmc8pdiu; XSRF-TOKEN=eyJpdiI6InppbkhrT1dpeU1JTFRJVG5QdlFQSmc9PSIsInZhbHVlIjoiMVFEOEladnlQNElsaVc0cmIzRDRCZUdPU0ZUaXlJSkxVOTNuVDFKb3NYRW5WMDBjSjZxTGpUVEUxMHUrOE5rM21TbmJtOWVKdUUySG5UcHlJSmJnVzhiRDdpb3hYWk9KVmgzd1B3b05UUmVkbUNQcFRIOFFxV05EYzg4ZWdtOEciLCJtYWMiOiI5ODg1ZjZjZTJmZTFiNjE0NWQyZGQ1ZWRkNTEwNzVjZDQ5ODc0MDdmN2U2NTJiYTkxOWUzM2Y1NjY2YjhjNTRkIiwidGFnIjoiIn0%3D|

  @Negative @Security
  Scenario: TC_01 Get outlet balance without access token
    When I send the GET request to "getoutletbalance" endpoint with query parameters
      |QueryParamName|QueryParamValue|
      |outletId|2|
      |warehouseId|3|
      |language|en|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get outlet balance with invalid access token
    And I send the GET request to "getoutletbalance" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
      |outletId|2|
      |warehouseId|3|
      |language|en|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_03 Get outlet balance with valid access token
    And I send the GET request to "getoutletbalance" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|3|
      |language|en|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_04 Performance test for getoutletbalance endpoint
    And I send the GET request to "getoutletbalance" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|3|
      |language|en|
    Then I should see the response code as "200"
    And verify response time is less than "1000" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Validation
  Scenario: TC_05 Get outlet balance with missing required parameters
    And I send the GET request to "getoutletbalance" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|false|
    And verify response time is less than "2500" milliseconds

  @Positive @Functional
  Scenario: TC_06 Get outlet balance for outletId 2 and warehouseId 3 with valid access token
    And I send the GET request to "getoutletbalance" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|3|
      |language|en|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|
      |$.outletBalance|0|
      |$.credit_limit|0|
      |$.credit_days|0|
      |$.no_of_invoice_limit|0|
      |$.outletId|"2"|
    And validating the response field data types
      |JPath|ExpectedType|
      |$.result|boolean|
      |$.outletBalance|number|
      |$.credit_limit|number|
      |$.credit_days|number|
      |$.no_of_invoice_limit|number|
      |$.outletId|string|

  @Negative @Validation
  Scenario: TC_07 Get outlet balance with non-existent outletId
    And I send the GET request to "getoutletbalance" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|999999|
      |warehouseId|3|
      |language|en|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.result|true|

  @Negative @Security  @outletGetOutletBalance
  Scenario: TC_08 Get outlet balance with malformed access token
    And I send the GET request to "getoutletbalance" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
      |outletId|2|
      |warehouseId|3|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users" 

  @Negative @Boundary
  Scenario: TC_09 Get outlet balance with boundary outletId and warehouseId
    And I send the GET request to "getoutletbalance" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|0|
      |warehouseId|0|
      |language|en|
    Then I should see the response code as "200"

  @Negative @ErrorHandling
  Scenario: TC_10 Get outlet balance with invalid resource URI
    And I send the GET request to "getoutletbalance_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
      |outletId|2|
      |warehouseId|3|
      |language|en|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
