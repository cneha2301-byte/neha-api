package com.Bizom.stepDefinitions;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import com.jayway.jsonpath.Configuration;
import com.jayway.jsonpath.JsonPath;
import com.jayway.jsonpath.Option;
import com.Bizom.api.Base.TestContext;
import com.Bizom.ccl.WS_PayloadsHeaders;
import com.Bizom.commonUtils.DBUtil;
import com.Bizom.commonUtils.JsonUtils;
import com.Bizom.commonUtils.ResourceURIS;
import com.Bizom.commonUtils.RestAssuredUtils;
import com.Bizom.reportutils.ReportManager;

import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.And;
import io.cucumber.java.en.When;
import org.w3c.dom.Document;
import org.xml.sax.InputSource;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathFactory;

public class GetSteps {

    private TestContext apiTestContext;
    private Random rnd = new Random();
    private DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

    public GetSteps(TestContext apiTestContext) {
        this.apiTestContext = apiTestContext;
    }

    private String getTableValue(Map<String, String> row, String... keys) {
        for (String k : keys) {
            if (row.containsKey(k) && row.get(k) != null) {
                return row.get(k);
            }
        }
        return null;
    }

    /**
     * Process dynamic values for GET request parameters
     * Handles empty values, random data, dates, and database queries
     */
    private String processDynamicValue(String value) {
        if (value == null) {
            return "";
        }

        // Trim whitespace first
        value = value.trim();

        // Handle empty value
        if (value.isEmpty() || "[empty]".equalsIgnoreCase(value)) {
            return "";
        }
        // Handle random numbers
        else if ("random".equalsIgnoreCase(value)) {
            return String.valueOf(rnd.nextInt(90000) + 10000); // 5-digit random
        }
        else if ("randomInt".equalsIgnoreCase(value)) {
            return String.valueOf(rnd.nextInt(90) + 10); // 2-digit random
        }
        else if ("randomPhoneNo".equalsIgnoreCase(value)) {
            long random9Digit = (long) (rnd.nextDouble() * 1_000_000_000L);
            return "9" + String.format("%09d", random9Digit);
        }
        else if ("randomStr".equalsIgnoreCase(value)) {
            String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < 10; i++) {
                sb.append(chars.charAt(rnd.nextInt(chars.length())));
            }
            return sb.toString();
        }
        else if ("randomDouble".equalsIgnoreCase(value)) {
            return String.format("%.2f", rnd.nextDouble() * 1000);
        }
        else if ("randomAlphaNum".equalsIgnoreCase(value)) {
            String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < 10; i++) {
                sb.append(chars.charAt(rnd.nextInt(chars.length())));
            }
            return sb.toString();
        }
        // Handle dates
        else if (value.startsWith("pastDate:")) {
            try {
                String[] parts = value.split(":");
                int days = Integer.parseInt(parts[1].trim());
                return LocalDate.now().minusDays(days).format(formatter);
            } catch (Exception e) {
                throw new RuntimeException("Error parsing pastDate: " + value + " - " + e.getMessage());
            }
        }
        else if (value.startsWith("futureDate:")) {
            try {
                String[] parts = value.split(":");
                int days = Integer.parseInt(parts[1].trim());
                return LocalDate.now().plusDays(days).format(formatter);
            } catch (Exception e) {
                throw new RuntimeException("Error parsing futureDate: " + value + " - " + e.getMessage());
            }
        }
        else if ("todayDate".equalsIgnoreCase(value)) {
            return LocalDate.now().format(formatter);
        }
        // Treat "null" as empty string
        else if ("null".equalsIgnoreCase(value)) {
            return "";
        }
        // Handle database queries
        else if (value.startsWith("DB:")) {
            try {
                // Expected format: DB:tableName:col1,col2:whereClause
                String[] parts = value.split(":", 4);
                String tableName = parts[1].trim();
                List<String> cols = Arrays.asList(parts[2].trim().split(","));
                String whereClause = parts.length > 3 ? parts[3].trim() : null;

                List<Map<String, Object>> dbData = DBUtil.getData(tableName, cols, whereClause);
                if (!dbData.isEmpty()) {
                    // If single column requested → just pick first row/col
                    if (cols.size() == 1) {
                        Object result = dbData.get(0).get(cols.get(0).trim());
                        return result != null ? String.valueOf(result) : "";
                    } else {
                        // If multiple columns, return as string representation
                        return dbData.get(0).toString();
                    }
                } else {
                    throw new RuntimeException("No DB data found for: " + value);
                }
            } catch (Exception e) {
                throw new RuntimeException("Error processing DB query: " + value + " - " + e.getMessage());
            }
        }
        // Default: return the provided value as-is
        else {
            return value;
        }
    }

    // Gets the resource uri based on request name from DB and sends get request
    @When("^I send the GET request to \"([^\"]*)\" endpoint$")
    public void get(String fileName) {

        if (apiTestContext.getApiTestBase().requestMap.isEmpty()) {
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.REQUEST_NAME.name(), fileName);
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.RESOURCE_URI.name(),
                    ResourceURIS.getResourceURI(fileName));
        }

        //String externalId = ((ResponseOptions<Response>) apiTestContext.getApiTestBase().requestMap).getHeader("Accept-Charset");
        apiTestContext.getApiTestBase().specification.baseUri(RestAssuredUtils.baseURI);
        apiTestContext.getApiTestBase().response = RestAssuredUtils.get(apiTestContext.getApiTestBase().specification,
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()));

    }
    /*
     * Gets the resource uri based on request name from DB, gets path params from
     * data table and sends get request
     */

    @When("^I send the GET request to \"([^\"]*)\" endpoint with path parameters$")
    public void getWithPathPrams(String fileName, DataTable dataTable) {

        List<Map<String, String>> table = dataTable.asMaps();

        Map<String, Object> pathParams = new HashMap<String, Object>();
        for (int i = 0; i < table.size(); i++) {
            String value = table.get(i).get("Value");
            if (value == null)
                value = "";
            else
                value = processDynamicValue(value);
            pathParams.put(table.get(i).get("Path"), value);
        }
        if (apiTestContext.getApiTestBase().requestMap.isEmpty()) {
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.REQUEST_NAME.name(), fileName);
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.RESOURCE_URI.name(),
                    ResourceURIS.getResourceURI(fileName));
        }
        apiTestContext.getApiTestBase().specification.baseUri(RestAssuredUtils.baseURI);
        apiTestContext.getApiTestBase().response = RestAssuredUtils.get(apiTestContext.getApiTestBase().specification,
                pathParams, apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()));
    }
    @When("^I send the GET request to \"([^\"]*)\" endpoint with path parameters and without encoded url$")
    public void getWithPathPramswithoutencodedurl(String fileName, DataTable dataTable) {
        List<Map<String, String>> table = dataTable.asMaps();

        Map<String, Object> pathParams = new HashMap<String, Object>();
        for (int i = 0; i < table.size(); i++) {
            String value = table.get(i).get("Value");
            if (value == null)
                value = "";
            else
                value = processDynamicValue(value);
            pathParams.put(table.get(i).get("Path"), value);
        }
        if (apiTestContext.getApiTestBase().requestMap.isEmpty()) {
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.REQUEST_NAME.name(), fileName);
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.RESOURCE_URI.name(),
                    ResourceURIS.getResourceURI(fileName));
        }
        apiTestContext.getApiTestBase().specification.baseUri(RestAssuredUtils.baseURI);
        apiTestContext.getApiTestBase().response = RestAssuredUtils.get(
                apiTestContext.getApiTestBase().specification.urlEncodingEnabled(false), pathParams,
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()));
        ReportManager.logInfoAPI(LocalDateTime.now().toString());
    }

    /*
     * Gets the resource uri based on request name from DB, gets query params from
     * data table and sends get request
     */

    @When("^I send the GET request to \"([^\"]*)\" endpoint with query parameters$")
    public void getWithQueryParams(String fileName, DataTable dataTable) {
        List<Map<String, String>> table = dataTable.asMaps();
        Map<String, Object> queryParams = new HashMap<String, Object>();

        for (int i = 0; i < table.size(); i++) {
            String qName = getTableValue(table.get(i), "QueryParamName", "queryparamname");
            String qValue = getTableValue(table.get(i), "QueryParamValue", "queryparamvalue");
            if (qName != null) {
                qValue = (qValue != null) ? processDynamicValue(qValue) : "";
                queryParams.put(qName, qValue);
            }
        }
        if (apiTestContext.getApiTestBase().requestMap.isEmpty()) {
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.REQUEST_NAME.name(), fileName);
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.RESOURCE_URI.name(),
                    ResourceURIS.getResourceURI(fileName));
        }
        apiTestContext.getApiTestBase().specification.baseUri(RestAssuredUtils.baseURI);
        apiTestContext.getApiTestBase().response = RestAssuredUtils.get(apiTestContext.getApiTestBase().specification,
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()), queryParams);
    }
    /*
     * Gets the resource uri based on request name from DB, gets path and query
     * params from data table and sends get request
     */

    @When("^I send the GET request to \"([^\"]*)\" endpoint with query and path parameters$")
    public void getWithQueryAndPathParams(String fileName, DataTable dataTable) {
        List<Map<String, String>> table = dataTable.asMaps();
        Map<String, Object> queryParams = new HashMap<String, Object>();
        Map<String, Object> pathParams = new HashMap<String, Object>();
        for (int i = 0; i < table.size(); i++) {
            String qName = getTableValue(table.get(i), "QueryParamName", "queryparamname");
            if (qName != null) {
                String qValue = getTableValue(table.get(i), "QueryParamValue", "queryparamvalue");
                qValue = (qValue != null) ? processDynamicValue(qValue) : "";
                queryParams.put(qName, qValue);
            }
            if (table.get(i).get("Path") != null) {
                String pathValue = table.get(i).get("Value");
                pathValue = (pathValue != null) ? processDynamicValue(pathValue) : "";
                pathParams.put(table.get(i).get("Path"), pathValue);
            }
        }
        if (apiTestContext.getApiTestBase().requestMap.isEmpty()) {
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.REQUEST_NAME.name(), fileName);
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.RESOURCE_URI.name(),
                    ResourceURIS.getResourceURI(fileName));
        }
        apiTestContext.getApiTestBase().specification.baseUri(RestAssuredUtils.baseURI);
        apiTestContext.getApiTestBase().response = RestAssuredUtils.get(apiTestContext.getApiTestBase().specification,
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()), queryParams,
                pathParams);

    }

    @When("^I send the GET request to \"([^\"]*)\" endpoint with query and path parameters and without encoded url$")
    public void getWithQueryAndPathParamswithoutencodedurl(String fileName, DataTable dataTable) {
        List<Map<String, String>> table = dataTable.asMaps();
        Map<String, Object> queryParams = new HashMap<String, Object>();
        Map<String, Object> pathParams = new HashMap<String, Object>();
        for (int i = 0; i < table.size(); i++) {
            String qName = getTableValue(table.get(i), "QueryParamName", "queryparamname");
            if (qName != null) {
                String qValue = getTableValue(table.get(i), "QueryParamValue", "queryparamvalue");
                qValue = (qValue != null) ? processDynamicValue(qValue) : "";
                queryParams.put(qName, qValue);
            }
            if (table.get(i).get("Path") != null) {
                String pathValue = table.get(i).get("Value");
                pathValue = (pathValue != null) ? processDynamicValue(pathValue) : "";
                pathParams.put(table.get(i).get("Path"), pathValue);
            }
        }
        if (apiTestContext.getApiTestBase().requestMap.isEmpty()) {
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.REQUEST_NAME.name(), fileName);
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.RESOURCE_URI.name(),
                    ResourceURIS.getResourceURI(fileName));
        }
        apiTestContext.getApiTestBase().specification.baseUri(RestAssuredUtils.baseURI);
        apiTestContext.getApiTestBase().response = RestAssuredUtils.get(
                apiTestContext.getApiTestBase().specification.urlEncodingEnabled(false),
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()), queryParams,
                pathParams);

    }
    @And("hit the Get request to endpoint with query parameters")
    public void putWithQueryParams(DataTable dataTable) {
        List<Map<String, String>> table = dataTable.asMaps();
        Map<String, Object> queryParams = new HashMap<String, Object>();
        for (int i = 0; i < table.size(); i++) {
            String qName = getTableValue(table.get(i), "QueryParamName", "queryparamname");
            String qValue = getTableValue(table.get(i), "QueryParamValue", "queryparamvalue");
            if (qName != null) {
                qValue = (qValue != null) ? processDynamicValue(qValue) : "";
                queryParams.put(qName, qValue);
            }
        }
        apiTestContext.getApiTestBase().response = RestAssuredUtils.get(apiTestContext.getApiTestBase().specification,
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()),
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.PAYLOAD.name()), queryParams);
    }

    /*
     * GET Method endpoint with query parameters without encoded url
     */

    @When("^I send the GET request to \"([^\"]*)\" endpoint with query parameters without encoded url$")
    public void getWithQueryParamsWithoutEncodedUrl(String fileName, DataTable dataTable) {
        List<Map<String, String>> table = dataTable.asMaps();
        Map<String, Object> queryParams = new HashMap<String, Object>();

        for (int i = 0; i < table.size(); i++) {
            String qName = getTableValue(table.get(i), "QueryParamName", "queryparamname");
            String qValue = getTableValue(table.get(i), "QueryParamValue", "queryparamvalue");
            if (qName != null) {
                qValue = (qValue != null) ? processDynamicValue(qValue) : "";
                queryParams.put(qName, qValue);
            }
        }
        if (apiTestContext.getApiTestBase().requestMap.isEmpty()) {
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.REQUEST_NAME.name(), fileName);
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.RESOURCE_URI.name(),
                    ResourceURIS.getResourceURI(fileName));
        }
        apiTestContext.getApiTestBase().specification.baseUri(RestAssuredUtils.baseURI);
        apiTestContext.getApiTestBase().response = RestAssuredUtils.get(
                apiTestContext.getApiTestBase().specification.urlEncodingEnabled(false),
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()), queryParams);
    }

    /*
     * Gets the resource uri and payload based on request name from DB and sends get
     * request
     */
    @When("^I send the GET request to \"([^\"]*)\" endpoint with urlEncoded payload$")
    public void getWithurlEncodedRequestBody(String fileName, DataTable dataTable) {
        List<String> table = dataTable.asList();
        if (apiTestContext.getApiTestBase().requestMap.isEmpty()) {
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.REQUEST_NAME.name(), fileName);
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.RESOURCE_URI.name(),
                    ResourceURIS.getResourceURI(fileName));
        }

        apiTestContext.getApiTestBase().response = RestAssuredUtils.get(apiTestContext.getApiTestBase().specification,
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()), table.get(0));

    }
//  @When("I send the GET request to {} endpoint with path parameters")
//  public void putWithPathPrams(String endPoint, DataTable dataTable) {
//
//     Configuration configuration = Configuration.builder().options(Option.SUPPRESS_EXCEPTIONS).build();
//     File json = new File(Constants.JSONINPUT_DIR + endPoint + ".json");
//     String request = null;
//     try {
//        request = JsonPath.using(configuration).parse(json).jsonString();
//     } catch (IOException e) {
//        // TODO Auto-generated catch block
//        // Error handled silently - failure will be reported by test framework
//     }
//
//     List<Map<String, String>> table = dataTable.asMaps();
//     Map<String, Object> pathParams = new HashMap<String, Object>();
//     for (int i = 0; i < table.size(); i++) {
//        String value = table.get(i).get("Value");
//        if (value == null)
//           value = "";
//        pathParams.put(table.get(i).get("Path"), value);
//     }
//     if (apiTestContext.getApiTestBase().requestMap.isEmpty()) {
//        apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.REQUEST_NAME.name(), endPoint);
//        apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.RESOURCE_URI.name(),
//              ResourceURIS.getResourceURI(endPoint));
//     }
//     apiTestContext.getApiTestBase().specification.baseUri(RestAssuredUtils.baseURI);
//     apiTestContext.getApiTestBase().response = RestAssuredUtils.put(apiTestContext.getApiTestBase().specification,
//           request, apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()),
//           pathParams);

//        ReportManager.logInfoAPI(LocalDateTime.now().toString());

    //}

    @And("I hit the Get request to {string} endpoint with query parameters in chain value")
    public void getReqWithQueryChainValue(String fileName, DataTable dataTable) throws InterruptedException {

        List<Map<String, String>> table = dataTable.asMaps();
        Map<String, Object> queryParams = new HashMap<String, Object>();
        for (int i = 0; i < table.size(); i++) {
            String qName = getTableValue(table.get(i), "QueryParamName", "queryparamname");
            if (qName != null) {
                queryParams.put(qName, ApiRequestModificationSteps.quote_id);
            }
        }
        apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.REQUEST_NAME.name(), fileName);
        apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.RESOURCE_URI.name(),
                ResourceURIS.getResourceURI(fileName));

        apiTestContext.getApiTestBase().specification.baseUri(RestAssuredUtils.baseURI);
        apiTestContext.getApiTestBase().response = RestAssuredUtils.get(apiTestContext.getApiTestBase().specification,
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()),queryParams);
        ReportManager.logInfoAPI(LocalDateTime.now().toString());
    }
    @And("I send get request with {string} requestname and {string} jpath value as path parameter from  {string} response file")
    public void getDynamicIdFromResponseFile(String fileName, String jPaths,String responseFileName, DataTable dataTable) {
        List<Map<String, String>> table = dataTable.asMaps();
        Configuration configuration = Configuration.builder().options(Option.SUPPRESS_EXCEPTIONS).build();
        Map<String, Object> pathParams = new HashMap<String, Object>();
        File responseFile = new File("./ResponseStore/" + responseFileName + ".json");
        String responseBody;
        try {
            responseBody = JsonPath.using(configuration).parse(responseFile).jsonString();
            Map<String, Object> contextMap = new HashMap<String, Object>();
            for (String path : jPaths.split(";")) {
                String key = path.substring(path.lastIndexOf(".") + 1, path.length());
                contextMap.put(key, JsonUtils.getJSonObjectValue(responseBody, path));
                String.valueOf(JsonUtils.getJSonObjectValue(responseBody, path));
                apiTestContext.getApiTestBase().contextMap = contextMap;

                for (int i = 0; i < table.size(); i++) {
                    String value = String.valueOf(JsonUtils.getJSonObjectValue(responseBody, path));
                    pathParams.put(table.get(i).get("Path"), value);
                }
            }
        } catch (IOException e) {
            // TODO Auto-generated catch block
            // Error handled silently - failure will be reported by test framework
        }
        apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.REQUEST_NAME.name(), fileName);
        apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.RESOURCE_URI.name(),
                ResourceURIS.getResourceURI(fileName));
        apiTestContext.getApiTestBase().specification.baseUri(RestAssuredUtils.baseURI);
        apiTestContext.getApiTestBase().response = RestAssuredUtils.get(apiTestContext.getApiTestBase().specification,
                pathParams, apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()));
        ReportManager.logInfoAPI(LocalDateTime.now().toString());
        ReportManager.logInfoAPI("<details><summary><font color=\"green\"><b>Click to view Response</b></font></summary><p><pre>"+apiTestContext.getApiTestBase().response.prettyPrint()+"</pre></script></p></details>");

    }
    @When("I send get request with {string} requestname and {string} jpath value as query parameter from  {string} response file")
    public void getwithPayloadWithChaindataQueryParameter(String fileName, String jPaths, String responseFileName,
                                                          DataTable dataTable) {
        List<Map<String, String>> table = dataTable.asMaps();
        Configuration configuration = Configuration.builder().options(Option.SUPPRESS_EXCEPTIONS).build();
        Map<String, Object> queryParams = new HashMap<String, Object>();
        File responseFile = new File("./ResponseStore/" + responseFileName + ".json");
        String responseBody;
        try {
            responseBody = JsonPath.using(configuration).parse(responseFile).jsonString();
            Map<String, Object> contextMap = new HashMap<String, Object>();
            for (String path : jPaths.split(";")) {
                String key = path.substring(path.lastIndexOf(".") + 1, path.length());
                contextMap.put(key, JsonUtils.getJSonObjectValue(responseBody, path));
                String.valueOf(JsonUtils.getJSonObjectValue(responseBody, path));

                apiTestContext.getApiTestBase().contextMap = contextMap;

                for (int i = 0; i < table.size(); i++) {
                    String value = String.valueOf(JsonUtils.getJSonObjectValue(responseBody, path));
                    queryParams.put(table.get(i).get("Path"), value);
                }
            }

        } catch (IOException e) {
            // TODO Auto-generated catch block
            // Error handled silently - failure will be reported by test framework
        }

        apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.REQUEST_NAME.name(), fileName);
        apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.RESOURCE_URI.name(),
                ResourceURIS.getResourceURI(fileName));

        apiTestContext.getApiTestBase().specification.baseUri(RestAssuredUtils.baseURI);
        apiTestContext.getApiTestBase().response = RestAssuredUtils.get(apiTestContext.getApiTestBase().specification,
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()),queryParams);
        ReportManager.logInfoAPI(LocalDateTime.now().toString());
    }
    @When("I send get request with {string} requestname and {string} jpath value from {string} response file and {string} jpath value from {string} response file")
    public void getwithPayloadWithChaindata1(String fileName,String path, String fileName0,String path1, String fileName1) {
        Configuration configuration = Configuration.builder().options(Option.SUPPRESS_EXCEPTIONS).build();
        Map<String, Object> pathParams = new HashMap<String, Object>();

        File json = new File("./ResponseStore/" + fileName0 + ".json");
        String responseBody;

        try {
            responseBody = JsonPath.using(configuration).parse(json).jsonString();
            String quote_idValue=String.valueOf(JsonUtils.getJSonObjectValue(responseBody, path));
            pathParams.put("session_token", quote_idValue);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            // Error handled silently - failure will be reported by test framework
        }
        File json1 = new File("./ResponseStore/" + fileName1 + ".json");
        String responseBody1;
        try {
            responseBody1 = JsonPath.using(configuration).parse(json1).jsonString();
            String otpValue=String.valueOf(JsonUtils.getJSonObjectValue(responseBody1, path1));
            pathParams.put("otp", otpValue);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            // Error handled silently - failure will be reported by test framework
        }


        apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.REQUEST_NAME.name(), fileName);
        apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.RESOURCE_URI.name(),
                ResourceURIS.getResourceURI(fileName));

        apiTestContext.getApiTestBase().specification.baseUri(RestAssuredUtils.baseURI);
        apiTestContext.getApiTestBase().response = RestAssuredUtils.get(apiTestContext.getApiTestBase().specification,
                pathParams, apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()));
        ReportManager.logInfoAPI(LocalDateTime.now().toString());
        ReportManager.logInfoAPI("<details><summary><font color=\"green\"><b>Click to view Response</b></font></summary><p><pre>"+apiTestContext.getApiTestBase().response.prettyPrint()+"</pre></script></p></details>");



    }
    @When("I send get request with {string} requestname and {string} jpath value from {string} response file and {string} jpath value from {string} response file as query parameter")
    public void getwithPayloadWithChaindataforQueryParams(String fileName,String path, String fileName0,String path1, String fileName1) {
        Configuration configuration = Configuration.builder().options(Option.SUPPRESS_EXCEPTIONS).build();
        Map<String, Object> queryParams = new HashMap<String, Object>();

        File json = new File("./ResponseStore/" + fileName0 + ".json");
        String responseBody;

        try {
            responseBody = JsonPath.using(configuration).parse(json).jsonString();
            String otpValue=String.valueOf(JsonUtils.getJSonObjectValue(responseBody, path));
            queryParams.put("otp", otpValue);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            // Error handled silently - failure will be reported by test framework
        }
        File json1 = new File("./ResponseStore/" + fileName1 + ".json");
        String responseBody1;
        try {
            responseBody1 = JsonPath.using(configuration).parse(json1).jsonString();
            String quote_idValue=String.valueOf(JsonUtils.getJSonObjectValue(responseBody1, path1));
            queryParams.put("session_token", quote_idValue);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            // Error handled silently - failure will be reported by test framework
        }


        apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.REQUEST_NAME.name(), fileName);
        apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.RESOURCE_URI.name(),
                ResourceURIS.getResourceURI(fileName));

        apiTestContext.getApiTestBase().specification.baseUri(RestAssuredUtils.baseURI);
        apiTestContext.getApiTestBase().response = RestAssuredUtils.get(apiTestContext.getApiTestBase().specification, apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()),queryParams);
        ReportManager.logInfoAPI(LocalDateTime.now().toString());
        ReportManager.logInfoAPI("<details><summary><font color=\"green\"><b>Click to view Response</b></font></summary><p><pre>"+apiTestContext.getApiTestBase().response.prettyPrint()+"</pre></script></p></details>");
    }


    @When("^I send the GET request to \"([^\"]*)\" endpoint with dynamic access token and query parameters$")
    public void getWithDynamicAccessTokenAndQueryParams(String fileName, DataTable dataTable) {

        List<Map<String, String>> table = dataTable.asMaps();
        Map<String, Object> queryParams = new HashMap<String, Object>();

        for (int i = 0; i < table.size(); i++) {
            String paramName = getTableValue(table.get(i), "QueryParamName", "queryparamname");
            String paramValue = getTableValue(table.get(i), "QueryParamValue", "queryparamvalue");

            String resolvedValue;
            if ("ACCESS_TOKEN".equalsIgnoreCase(paramValue)) {
                try {

                    BufferedReader br = new BufferedReader(
                            new InputStreamReader(new FileInputStream("ResponseBody/accessToken.xml"), StandardCharsets.UTF_8)
                    );
                    StringBuilder sb = new StringBuilder();
                    String line;
                    while ((line = br.readLine()) != null) {
                        sb.append(line).append("\n");
                    }
                    br.close();

                    // Remove any second XML declaration
                    String xml = sb.toString().replaceFirst("(?s)<\\?xml.*?\\?>", "");
                    xml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" + xml.trim();

                    DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
                    DocumentBuilder builder = factory.newDocumentBuilder();
                    Document document = builder.parse(new InputSource(new StringReader(xml)));
                    document.getDocumentElement().normalize();

                    XPath xpath = XPathFactory.newInstance().newXPath();
                    String token = (String) xpath.evaluate("/Response/Token", document, XPathConstants.STRING);


                    resolvedValue = (token != null) ? token.trim() : "";

                } catch (Exception e) {
                    resolvedValue = "";
                }
            } else {
                resolvedValue = (paramValue != null) ? processDynamicValue(paramValue) : "";
            }

            if (paramName != null) {
                queryParams.put(paramName, resolvedValue);
            }
        }
        if (apiTestContext.getApiTestBase().requestMap.isEmpty()) {
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.REQUEST_NAME.name(), fileName);
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.RESOURCE_URI.name(),
                    ResourceURIS.getResourceURI(fileName));
        }

        apiTestContext.getApiTestBase().specification.baseUri(RestAssuredUtils.baseURI);
        apiTestContext.getApiTestBase().response = RestAssuredUtils.get(
                apiTestContext.getApiTestBase().specification,
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()),
                queryParams);
    }

    @When("^I send the GET request to \"([^\"]*)\" endpoint with dynamic access token, query parameters and payload$")
    public void getWithDynamicAccessTokenAndQueryParamsWithPayload(String fileName, DataTable dataTable) {

        List<Map<String, String>> table = dataTable.asMaps();
        Map<String, Object> queryParams = new HashMap<String, Object>();

        for (int i = 0; i < table.size(); i++) {
            String paramName = getTableValue(table.get(i), "QueryParamName", "queryparamname");
            String paramValue = getTableValue(table.get(i), "QueryParamValue", "queryparamvalue");

            String resolvedValue;
            if ("ACCESS_TOKEN".equalsIgnoreCase(paramValue)) {
                try {

                    BufferedReader br = new BufferedReader(
                            new InputStreamReader(new FileInputStream("ResponseBody/accessToken.xml"), StandardCharsets.UTF_8)
                    );
                    StringBuilder sb = new StringBuilder();
                    String line;
                    while ((line = br.readLine()) != null) {
                        sb.append(line).append("\n");
                    }
                    br.close();

                    String xml = sb.toString().replaceFirst("(?s)<\\?xml.*?\\?>", "");
                    xml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" + xml.trim();

                    DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
                    DocumentBuilder builder = factory.newDocumentBuilder();
                    Document document = builder.parse(new InputSource(new StringReader(xml)));
                    document.getDocumentElement().normalize();

                    XPath xpath = XPathFactory.newInstance().newXPath();
                    String token = (String) xpath.evaluate("/Response/Token", document, XPathConstants.STRING);

                    resolvedValue = (token != null) ? token.trim() : "";

                } catch (Exception e) {
                    resolvedValue = "";
                }
            } else {
                resolvedValue = (paramValue != null) ? processDynamicValue(paramValue) : "";
            }

            if (paramName != null) {
                queryParams.put(paramName, resolvedValue);
            }
        }

        if (apiTestContext.getApiTestBase().requestMap.isEmpty()) {
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.REQUEST_NAME.name(), fileName);
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.RESOURCE_URI.name(),
                    ResourceURIS.getResourceURI(fileName));
        }

        apiTestContext.getApiTestBase().specification.baseUri(RestAssuredUtils.baseURI);
        // Use payload from requestMap if present
        Object payload = apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.PAYLOAD.name());
        if (payload != null) {
            apiTestContext.getApiTestBase().response = RestAssuredUtils.get(
                    apiTestContext.getApiTestBase().specification,
                    apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()),
                    payload.toString(), queryParams);
        } else {
            // Fallback to GET without payload
            apiTestContext.getApiTestBase().response = RestAssuredUtils.get(
                    apiTestContext.getApiTestBase().specification,
                    apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()),
                    queryParams);
        }
    }

    @When("^I send the GET request to \"([^\"]*)\" endpoint with dynamic access token, path and query parameters$")
    public void getWithDynamicAccessTokenPathAndQueryParams(String fileName, DataTable dataTable) {

        List<Map<String, String>> table = dataTable.asMaps();
        Map<String, Object> queryParams = new HashMap<String, Object>();
        Map<String, Object> pathParams = new HashMap<String, Object>();

        for (int i = 0; i < table.size(); i++) {
            String paramName = getTableValue(table.get(i), "QueryParamName", "queryparamname");
            if (paramName != null) {
                String paramValue = getTableValue(table.get(i), "QueryParamValue", "queryparamvalue");

                String resolvedValue;
                if ("ACCESS_TOKEN".equalsIgnoreCase(paramValue)) {
                    try {

                        BufferedReader br = new BufferedReader(
                                new InputStreamReader(new FileInputStream("ResponseBody/accessToken.xml"), StandardCharsets.UTF_8)
                        );
                        StringBuilder sb = new StringBuilder();
                        String line;
                        while ((line = br.readLine()) != null) {
                            sb.append(line).append("\n");
                        }
                        br.close();

                        // Remove any second XML declaration
                        String xml = sb.toString().replaceFirst("(?s)<\\?xml.*?\\?>", "");
                        xml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" + xml.trim();

                        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
                        DocumentBuilder builder = factory.newDocumentBuilder();
                        Document document = builder.parse(new InputSource(new StringReader(xml)));
                        document.getDocumentElement().normalize();

                        XPath xpath = XPathFactory.newInstance().newXPath();
                        String token = (String) xpath.evaluate("/Response/Token", document, XPathConstants.STRING);


                        resolvedValue = (token != null) ? token.trim() : "";

                    } catch (Exception e) {
                        resolvedValue = "";
                    }
                }else {
                    resolvedValue = (paramValue != null) ? processDynamicValue(paramValue) : "";
                }

                queryParams.put(paramName, resolvedValue);
            }
            if (table.get(i).get("Path") != null) {
                String pathName = table.get(i).get("Path");
                String pathValue = table.get(i).get("Value");
                String resolvedPathValue = (pathValue != null) ? processDynamicValue(pathValue) : "";

                pathParams.put(pathName, resolvedPathValue);
            }
        }
        if (apiTestContext.getApiTestBase().requestMap.isEmpty()) {
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.REQUEST_NAME.name(), fileName);
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.RESOURCE_URI.name(),
                    ResourceURIS.getResourceURI(fileName));
        }
        apiTestContext.getApiTestBase().specification.baseUri(RestAssuredUtils.baseURI);
        apiTestContext.getApiTestBase().response = RestAssuredUtils.get(
                apiTestContext.getApiTestBase().specification,
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()),
                queryParams, pathParams);
    }

    /*
     * Sends GET request with path parameters and follows redirect to another endpoint
     * Used for endpoints that return 302 and redirect to another endpoint
     */
    @When("^I send the GET request to \"([^\"]*)\" endpoint with path parameters and follow redirection to \"([^\"]*)\" endpoint$")
    public void getWithPathParamsAndFollowRedirect(String fileName, String redirectEndpointName, DataTable dataTable) {
        List<Map<String, String>> table = dataTable.asMaps();
        Map<String, Object> pathParams = new HashMap<String, Object>();

        for (int i = 0; i < table.size(); i++) {
            if (table.get(i).get("Path") != null) {
                String pathName = table.get(i).get("Path");
                String pathValue = table.get(i).get("Value");
                String resolvedPathValue = (pathValue != null) ? pathValue : "";
                pathParams.put(pathName, resolvedPathValue);
            }
        }

        if (apiTestContext.getApiTestBase().requestMap.isEmpty()) {
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.REQUEST_NAME.name(), fileName);
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.RESOURCE_URI.name(),
                    ResourceURIS.getResourceURI(fileName));
        }

        apiTestContext.getApiTestBase().specification.baseUri(RestAssuredUtils.baseURI);
        
        // Send initial GET request
        apiTestContext.getApiTestBase().response = RestAssuredUtils.get(
                apiTestContext.getApiTestBase().specification,
                pathParams,
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()));

        // Check if we got a 302 redirect
        if (apiTestContext.getApiTestBase().response.statusCode() == 302) {
            // Follow the redirection to the specified endpoint
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.REQUEST_NAME.name(), redirectEndpointName);
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.RESOURCE_URI.name(),
                    ResourceURIS.getResourceURI(redirectEndpointName));
            
            // Send GET request to the redirect endpoint
            apiTestContext.getApiTestBase().response = RestAssuredUtils.get(
                    apiTestContext.getApiTestBase().specification,
                    apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()));
        }
    }
}
