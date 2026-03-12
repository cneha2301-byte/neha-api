@BizomWebAPI @AssetManagement @GET_AssetDetailsApprovalList
Feature: Asset Details Approval List API Tests

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |accept|application/json, text/javascript, */*; q=0.01|
      |accept-language|en-IN,en;q=0.9|
      |priority|u=1, i|
      |referer|https://stagingwalko.bizomstaging.in/assetdetails/approval|
      |sec-ch-ua|"Google Chrome";v="143", "Chromium";v="143", "Not A(Brand";v="24"|
      |sec-ch-ua-mobile|?0|
      |sec-ch-ua-platform|"Windows"|
      |sec-fetch-dest|empty|
      |sec-fetch-mode|cors|
      |sec-fetch-site|same-origin|
      |user-agent|Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36|
      |x-kl-kes-ajax-request|Ajax_Request|
      |x-requested-with|XMLHttpRequest|

  @Positive @Smoke
  Scenario: Verify Asset Details Approval List with valid cookies and parameters
    And I set cookies
      |cookieName|cookieValue|
      |language|en|
      |CAKEPHP|ael4s90emduufc4r4f2aggbdvf|
      |PHPSESSID|ael4s90emduufc4r4f2aggbdvf|
      |XSRF-TOKEN|eyJpdiI6IlNKRjdrYzY2RHFhSmx0T3VVUk9QYXc9PSIsInZhbHVlIjoiUmdWdVZuRkNHNndDKzk0clh2bVlWaTA3SWdaRHdXWE5XSzR5S2NUOERjbTZjRXNqS0RZSTM0K0F4YVk3dTlveStPdC9pU2N5TWw4S1RaOUkrMDNQdEx1WjJCajJhMlVwWjMzb1pjTkdlaGo1THhXZ3hvOXZDSDU4MGUyK1NaN0siLCJtYWMiOiJmNjM1YTJmNWIzZDQ4NWI5YTQ0MWI2ZWJhOWI5NTJmM2I1M2JmMTQ5MzNkMmEzYTgxNDRjNzYwNGY3NTA0YzBiIiwidGFnIjoiIn0%3D|
    And I send the GET request to "assetdetails_approvalList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |sSortDir_0|asc|
      |subzoneIds|31|
      |is_approve|0|
      |fromDate|21-10-2025|
      |toDate|19-01-2026|
      |_|1768819861802|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|
    And I store the response as "assetdetails_approvalList_response" name using full path

  @Positive @DataValidation
  Scenario: Validate Asset Details Approval List response data integrity
    And I set cookies
      |cookieName|cookieValue|
      |language|en|
      |CAKEPHP|ael4s90emduufc4r4f2aggbdvf|
      |PHPSESSID|ael4s90emduufc4r4f2aggbdvf|
      |XSRF-TOKEN|eyJpdiI6IlNKRjdrYzY2RHFhSmx0T3VVUk9QYXc9PSIsInZhbHVlIjoiUmdWdVZuRkNHNndDKzk0clh2bVlWaTA3SWdaRHdXWE5XSzR5S2NUOERjbTZjRXNqS0RZSTM0K0F4YVk3dTlveStPdC9pU2N5TWw4S1RaOUkrMDNQdEx1WjJCajJhMlVwWjMzb1pjTkdlaGo1THhXZ3hvOXZDSDU4MGUyK1NaN0siLCJtYWMiOiJmNjM1YTJmNWIzZDQ4NWI5YTQ0MWI2ZWJhOWI5NTJmM2I1M2JmMTQ5MzNkMmEzYTgxNDRjNzYwNGY3NTA0YzBiIiwidGFnIjoiIn0%3D|
    And I send the GET request to "assetdetails_approvalList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |sSortDir_0|asc|
      |subzoneIds|31|
      |is_approve|0|
      |fromDate|21-10-2025|
      |toDate|19-01-2026|
      |_|1768819861802|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.sEcho|1|

  @Positive @SchemaValidation
  Scenario: Validate Asset Details Approval List response data types
    And I set cookies
      |cookieName|cookieValue|
      |language|en|
      |CAKEPHP|ael4s90emduufc4r4f2aggbdvf|
      |PHPSESSID|ael4s90emduufc4r4f2aggbdvf|
      |XSRF-TOKEN|eyJpdiI6IlNKRjdrYzY2RHFhSmx0T3VVUk9QYXc9PSIsInZhbHVlIjoiUmdWdVZuRkNHNndDKzk0clh2bVlWaTA3SWdaRHdXWE5XSzR5S2NUOERjbTZjRXNqS0RZSTM0K0F4YVk3dTlveStPdC9pU2N5TWw4S1RaOUkrMDNQdEx1WjJCajJhMlVwWjMzb1pjTkdlaGo1THhXZ3hvOXZDSDU4MGUyK1NaN0siLCJtYWMiOiJmNjM1YTJmNWIzZDQ4NWI5YTQ0MWI2ZWJhOWI5NTJmM2I1M2JmMTQ5MzNkMmEzYTgxNDRjNzYwNGY3NTA0YzBiIiwidGFnIjoiIn0%3D|
    And I send the GET request to "assetdetails_approvalList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |sSortDir_0|asc|
      |subzoneIds|31|
      |is_approve|0|
      |fromDate|21-10-2025|
      |toDate|19-01-2026|
      |_|1768819861802|
    Then I should see the response code as "200"
    And validating the response field data types
      |JPath|ExpectedType|
      |$.sEcho|int|
      |$.iTotalRecords|int|
      |$.iTotalDisplayRecords|int|
      |$.aaData|array|
      |$.aaData[0].asset_id|string|
      |$.aaData[0].asset_name|string|
      |$.aaData[0].assignedby|string|
      |$.aaData[0].assignedbyuser_id|string|
      |$.aaData[0].createdDate|string|
      |$.aaData[0].data|string|
      |$.aaData[0].entitytype_id|string|
      |$.aaData[0].id|string|
      |$.aaData[0].is_approve|string|
      |$.aaData[0].outlet_id|string|
      |$.aaData[0].outlet_name|string|
      |$.aaData[0].color|string|
      |$.aaData[0].sale|int|
      |$.aaData[0].suggestOL|string|
      |$.aaData[0].suggestOLId|string|
      |$.aaData[0].user_id|string|
      |$.aaData[0].typeOfSuggestion|string|

  @Positive @ArrayValidation
  Scenario: Validate aaData array content count
    And I set cookies
      |cookieName|cookieValue|
      |language|en|
      |CAKEPHP|ael4s90emduufc4r4f2aggbdvf|
      |PHPSESSID|ael4s90emduufc4r4f2aggbdvf|
      |XSRF-TOKEN|eyJpdiI6IlNKRjdrYzY2RHFhSmx0T3VVUk9QYXc9PSIsInZhbHVlIjoiUmdWdVZuRkNHNndDKzk0clh2bVlWaTA3SWdaRHdXWE5XSzR5S2NUOERjbTZjRXNqS0RZSTM0K0F4YVk3dTlveStPdC9pU2N5TWw4S1RaOUkrMDNQdEx1WjJCajJhMlVwWjMzb1pjTkdlaGo1THhXZ3hvOXZDSDU4MGUyK1NaN0siLCJtYWMiOiJmNjM1YTJmNWIzZDQ4NWI5YTQ0MWI2ZWJhOWI5NTJmM2I1M2JmMTQ5MzNkMmEzYTgxNDRjNzYwNGY3NTA0YzBiIiwidGFnIjoiIn0%3D|
    And I send the GET request to "assetdetails_approvalList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |sSortDir_0|asc|
      |subzoneIds|31|
      |is_approve|0|
      |fromDate|21-10-2025|
      |toDate|19-01-2026|
      |_|1768819861802|
    Then I should see the response code as "200"
    And the fields in response should match with expected values
      |JPath|Value|
      |$.aaData.length()|4|

  @Positive @Sorting
  Scenario: Verify sorting by descending order
    And I set cookies
      |cookieName|cookieValue|
      |language|en|
      |CAKEPHP|ael4s90emduufc4r4f2aggbdvf|
      |PHPSESSID|ael4s90emduufc4r4f2aggbdvf|
      |XSRF-TOKEN|eyJpdiI6IlNKRjdrYzY2RHFhSmx0T3VVUk9QYXc9PSIsInZhbHVlIjoiUmdWdVZuRkNHNndDKzk0clh2bVlWaTA3SWdaRHdXWE5XSzR5S2NUOERjbTZjRXNqS0RZSTM0K0F4YVk3dTlveStPdC9pU2N5TWw4S1RaOUkrMDNQdEx1WjJCajJhMlVwWjMzb1pjTkdlaGo1THhXZ3hvOXZDSDU4MGUyK1NaN0siLCJtYWMiOiJmNjM1YTJmNWIzZDQ4NWI5YTQ0MWI2ZWJhOWI5NTJmM2I1M2JmMTQ5MzNkMmEzYTgxNDRjNzYwNGY3NTA0YzBiIiwidGFnIjoiIn0%3D|
    And I send the GET request to "assetdetails_approvalList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |sSortDir_0|desc|
      |subzoneIds|31|
      |is_approve|0|
      |fromDate|21-10-2025|
      |toDate|19-01-2026|
    Then I should see the response code as "200"

  @Positive @Filtering
  Scenario: Verify filtering by single day date range
    And I set cookies
      |cookieName|cookieValue|
      |language|en|
      |CAKEPHP|ael4s90emduufc4r4f2aggbdvf|
      |PHPSESSID|ael4s90emduufc4r4f2aggbdvf|
      |XSRF-TOKEN|eyJpdiI6IlNKRjdrYzY2RHFhSmx0T3VVUk9QYXc9PSIsInZhbHVlIjoiUmdWdVZuRkNHNndDKzk0clh2bVlWaTA3SWdaRHdXWE5XSzR5S2NUOERjbTZjRXNqS0RZSTM0K0F4YVk3dTlveStPdC9pU2N5TWw4S1RaOUkrMDNQdEx1WjJCajJhMlVwWjMzb1pjTkdlaGo1THhXZ3hvOXZDSDU4MGUyK1NaN0siLCJtYWMiOiJmNjM1YTJmNWIzZDQ4NWI5YTQ0MWI2ZWJhOWI5NTJmM2I1M2JmMTQ5MzNkMmEzYTgxNDRjNzYwNGY3NTA0YzBiIiwidGFnIjoiIn0%3D|
    And I send the GET request to "assetdetails_approvalList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |sSortDir_0|asc|
      |subzoneIds|31|
      |is_approve|0|
      |fromDate|21-10-2025|
      |toDate|21-10-2025|
    Then I should see the response code as "200"

  @Negative @Validation
  Scenario: Verify response with invalid date format
    And I set cookies
      |cookieName|cookieValue|
      |language|en|
      |CAKEPHP|ael4s90emduufc4r4f2aggbdvf|
      |PHPSESSID|ael4s90emduufc4r4f2aggbdvf|
      |XSRF-TOKEN|eyJpdiI6IlNKRjdrYzY2RHFhSmx0T3VVUk9QYXc9PSIsInZhbHVlIjoiUmdWdVZuRkNHNndDKzk0clh2bVlWaTA3SWdaRHdXWE5XSzR5S2NUOERjbTZjRXNqS0RZSTM0K0F4YVk3dTlveStPdC9pU2N5TWw4S1RaOUkrMDNQdEx1WjJCajJhMlVwWjMzb1pjTkdlaGo1THhXZ3hvOXZDSDU4MGUyK1NaN0siLCJtYWMiOiJmNjM1YTJmNWIzZDQ4NWI5YTQ0MWI2ZWJhOWI5NTJmM2I1M2JmMTQ5MzNkMmEzYTgxNDRjNzYwNGY3NTA0YzBiIiwidGFnIjoiIn0%3D|
    And I send the GET request to "assetdetails_approvalList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |sSortDir_0|asc|
      |subzoneIds|31|
      |is_approve|0|
      |fromDate|2025/10/21|
      |toDate|2026/01/19|
    Then I should see the response code as "200"

  @Negative @Validation
  Scenario: Verify response with fromDate greater than toDate
    And I set cookies
      |cookieName|cookieValue|
      |language|en|
      |CAKEPHP|ael4s90emduufc4r4f2aggbdvf|
      |PHPSESSID|ael4s90emduufc4r4f2aggbdvf|
      |XSRF-TOKEN|eyJpdiI6IlNKRjdrYzY2RHFhSmx0T3VVUk9QYXc9PSIsInZhbHVlIjoiUmdWdVZuRkNHNndDKzk0clh2bVlWaTA3SWdaRHdXWE5XSzR5S2NUOERjbTZjRXNqS0RZSTM0K0F4YVk3dTlveStPdC9pU2N5TWw4S1RaOUkrMDNQdEx1WjJCajJhMlVwWjMzb1pjTkdlaGo1THhXZ3hvOXZDSDU4MGUyK1NaN0siLCJtYWMiOiJmNjM1YTJmNWIzZDQ4NWI5YTQ0MWI2ZWJhOWI5NTJmM2I1M2JmMTQ5MzNkMmEzYTgxNDRjNzYwNGY3NTA0YzBiIiwidGFnIjoiIn0%3D|
    And I send the GET request to "assetdetails_approvalList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |sSortDir_0|asc|
      |subzoneIds|31|
      |is_approve|0|
      |fromDate|19-01-2026|
      |toDate|21-10-2025|
    Then I should see the response code as "200"

  @Negative @Validation
  Scenario: Verify response with missing subzoneIds
    And I set cookies
      |cookieName|cookieValue|
      |language|en|
      |CAKEPHP|ael4s90emduufc4r4f2aggbdvf|
      |PHPSESSID|ael4s90emduufc4r4f2aggbdvf|
      |XSRF-TOKEN|eyJpdiI6IlNKRjdrYzY2RHFhSmx0T3VVUk9QYXc9PSIsInZhbHVlIjoiUmdWdVZuRkNHNndDKzk0clh2bVlWaTA3SWdaRHdXWE5XSzR5S2NUOERjbTZjRXNqS0RZSTM0K0F4YVk3dTlveStPdC9pU2N5TWw4S1RaOUkrMDNQdEx1WjJCajJhMlVwWjMzb1pjTkdlaGo1THhXZ3hvOXZDSDU4MGUyK1NaN0siLCJtYWMiOiJmNjM1YTJmNWIzZDQ4NWI5YTQ0MWI2ZWJhOWI5NTJmM2I1M2JmMTQ5MzNkMmEzYTgxNDRjNzYwNGY3NTA0YzBiIiwidGFnIjoiIn0%3D|
    And I send the GET request to "assetdetails_approvalList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |sSortDir_0|asc|
      |is_approve|0|
      |fromDate|21-10-2025|
      |toDate|19-01-2026|
    Then I should see the response code as "200"

  @Negative @Security
  Scenario: Verify access without authentication cookies
    And I send the GET request to "assetdetails_approvalList" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |sSortDir_0|asc|
      |subzoneIds|31|
      |is_approve|0|
      |fromDate|21-10-2025|
      |toDate|19-01-2026|
    Then I should see the response code as "403"
