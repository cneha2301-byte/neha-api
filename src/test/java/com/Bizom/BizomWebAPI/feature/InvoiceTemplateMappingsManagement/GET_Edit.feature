@BizomWebAPI  @OS @InvoiceTemplateMappingsManagement @InvoiceTemplateMappingsEdit
Feature: Invoice Template Mappings Edit API Testing
  As a system user
  I want to test the invoice template mappings edit endpoint
  So that I can ensure proper functionality and HTML page rendering for editing invoice template mappings

  Background:
    Given I set up base URI for transactions
    When I set up request specification
      |HeaderName|HeaderValue|
      |Content-Type|application/json|
      |Accept|text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7|
      |Accept-Encoding|gzip,deflate, br|
      |Connection|keep-alive|
      |priority|u=0, i|
      |sec-ch-ua|"Chromium";v="142", "Google Chrome";v="142", "Not_A Brand";v="99"|
      |sec-ch-ua-mobile|?0|
      |sec-ch-ua-platform|"Windows"|
      |sec-fetch-dest|document|
      |sec-fetch-mode|navigate|
      |sec-fetch-site|none|
      |sec-fetch-user|?1|
      |upgrade-insecure-requests|1|
      |user-agent|Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36|

  @Negative @Security
  Scenario: TC_01 Get invoice template mappings edit without access token
    When I send the GET request to "invoicetemplatemappings_edit" endpoint
    Then I should see the response code as "200"
    And the HTML response should contain page title ""
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_02 Get invoice template mappings edit with invalid access token
    And I send the GET request to "invoicetemplatemappings_edit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|invalid_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_03 Get invoice template mappings edit with expired access token
    And I send the GET request to "invoicetemplatemappings_edit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|expired_token_12345|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Negative @Security
  Scenario: TC_04 Get invoice template mappings edit with malformed access token
    And I send the GET request to "invoicetemplatemappings_edit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|malformed.token.here|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds

  @Positive @Smoke
  Scenario: TC_05 Get invoice template mappings edit with valid access token
    And I send the GET request to "invoicetemplatemappings_edit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Invoicetemplatemappings"
    And I store the response as "invoice_template_mappings_edit_response" name using full path

  @Positive @DataValidation
  Scenario: TC_06 Validate invoice template mappings edit HTML response structure
    And I send the GET request to "invoicetemplatemappings_edit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Invoicetemplatemappings"

  @Positive @HTMLValidation
  Scenario: TC_07 Validate invoice template mappings edit HTML page title
    And I send the GET request to "invoicetemplatemappings_edit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain page title "Invoicetemplatemappings"

  @Positive @HTMLValidation
  Scenario: TC_08 Validate invoice template mappings edit HTML structure
    And I send the GET request to "invoicetemplatemappings_edit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And validating the response contains the following values
      |Value|
      |html|
      |head|
      |title|
      |body|

  @Positive @HTMLValidation
  Scenario: TC_09 Validate invoice template mappings edit HTML page structure elements
    And I send the GET request to "invoicetemplatemappings_edit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
    And the HTML response should contain element "html"
    And the HTML response should contain element "head"
    And the HTML response should contain element "title"
    And the HTML response should contain element "body"
    And the HTML response should contain page title "Invoicetemplatemappings"

  @Positive @Functional
  Scenario: TC_10 Verify invoice template mappings edit page loads successfully
    And I send the GET request to "invoicetemplatemappings_edit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Invoicetemplatemappings"

  @Positive @ResponseHeaders
  Scenario: TC_11 Verify invoice template mappings edit response headers
    And I send the GET request to "invoicetemplatemappings_edit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response headers
      |HeaderName|HeaderValue|
      |Content-Type|text/html; charset=UTF-8|
      |Connection|keep-alive|
    And verify response time is less than "2500" milliseconds

  @Positive @Performance
  Scenario: TC_12 Performance test for invoice template mappings edit endpoint
    And I send the GET request to "invoicetemplatemappings_edit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "1500" milliseconds
    And the HTML response should contain page title "Invoicetemplatemappings"

  @Negative @ErrorHandling
  Scenario: TC_13 Get invoice template mappings edit with invalid endpoint
    And I send the GET request to "invoicetemplatemappings_edit_invalid" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And the HTML response should contain page title "Users"
    And verify response time is less than "2500" milliseconds

  @Positive @ContentValidation
  Scenario: TC_14 Verify invoice template mappings edit page content
    And I send the GET request to "invoicetemplatemappings_edit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And verify response time is less than "2500" milliseconds
    And the HTML response should contain page title "Invoicetemplatemappings"
    And validating the response contains the following values
      |Value|
      |<html|
      |<head|
      |<body|

  @Positive @UIValidation
  Scenario: TC_15 Verify invoice template mappings edit page interface elements
    And I send the GET request to "invoicetemplatemappings_edit" endpoint with dynamic access token and query parameters
      |QueryParamName|QueryParamValue|
      |access_token|ACCESS_TOKEN|
    Then I should see the response code as "200"
    And contentType as "text/html; charset=UTF-8"
    And verify response time is less than "2500" milliseconds

