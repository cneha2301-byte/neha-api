package com.Bizom.stepDefinitions;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.time.LocalDateTime;
import java.util.*;
import java.util.zip.GZIPInputStream;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.jayway.jsonpath.Configuration;
import com.jayway.jsonpath.JsonPath;
import com.jayway.jsonpath.Option;
import com.Bizom.api.Base.TestContext;
import com.Bizom.ccl.WS_PayloadsHeaders;
import com.Bizom.commonUtils.Constants;
import com.Bizom.commonUtils.JsonUtils;
import com.Bizom.commonUtils.ResourceURIS;
import com.Bizom.commonUtils.RestAssuredUtils;
import com.Bizom.reportutils.ReportManager;
import javax.xml.xpath.XPathExpressionException;


import com.Bizom.ccl.*;
import com.Bizom.commonUtils.*;
import com.Bizom.reportutils.*;
import com.jayway.jsonpath.Configuration;
import com.jayway.jsonpath.JsonPath;
import com.jayway.jsonpath.Option;
import com.Bizom.api.Base.*;

import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.And;
import io.cucumber.java.en.When;
import io.restassured.RestAssured;
import io.restassured.config.DecoderConfig;
import io.restassured.http.ContentType;
import io.restassured.response.Response;
import io.restassured.response.ResponseBody;
import net.minidev.json.JSONObject;
import net.minidev.json.parser.JSONParser;
import net.minidev.json.parser.ParseException;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.xml.sax.InputSource;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;

public class PostSteps {

    private TestContext apiTestContext;

    public PostSteps(TestContext apiTestContext) {
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

    /*
     * Gets the uri and payload from db using request name and sends the post
     * request
     */
    @When("I post the request with {string} payload")
    public void postwithPayload(String fileName) throws IOException {

        if (apiTestContext.getApiTestBase().requestMap.isEmpty()) {
            Configuration configuration = Configuration.builder().options(Option.SUPPRESS_EXCEPTIONS).build();
            File json = new File(Constants.JSONINPUT_DIR + fileName + ".json");
            String request = null;
            try {
                request = JsonPath.using(configuration).parse(json).jsonString();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                // Error handled silently - failure will be reported by test framework
            }
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.PAYLOAD.name(), request);
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.REQUEST_NAME.name(), fileName);
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.RESOURCE_URI.name(),
                    ResourceURIS.getResourceURI(fileName));

            apiTestContext.getApiTestBase().specification.baseUri(RestAssuredUtils.baseURI);
        }
        RestAssured.config = RestAssured.config().decoderConfig(DecoderConfig.decoderConfig().noContentDecoders());


        apiTestContext.getApiTestBase().response = RestAssuredUtils.post(apiTestContext.getApiTestBase().specification,
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.PAYLOAD.name()),
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()));

    }

    @When("I post the request with XML {string} payload")
    public void postWithXmlPayload(String fileName) throws IOException {
        if (apiTestContext.getApiTestBase().requestMap.isEmpty()) {
            File xmlFile = new File(Constants.XMLINPUT_DIR + fileName + ".xml");
            String xmlRequest = null;

            try {
                xmlRequest = Files.readString(xmlFile.toPath(), StandardCharsets.UTF_8);
            } catch (IOException e) {
                // Error handled silently - failure will be reported by test framework
                throw e;
            }
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.PAYLOAD.name(), xmlRequest);
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.REQUEST_NAME.name(), fileName);
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.RESOURCE_URI.name(),
                    ResourceURIS.getResourceURI(fileName));
            apiTestContext.getApiTestBase().specification.baseUri(RestAssuredUtils.baseURI);
        }
        RestAssured.config = RestAssured.config()
                .decoderConfig(DecoderConfig.decoderConfig().noContentDecoders());

        apiTestContext.getApiTestBase().specification.contentType(ContentType.XML);

        apiTestContext.getApiTestBase().response = RestAssuredUtils.post(
                apiTestContext.getApiTestBase().specification,
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.PAYLOAD.name()),
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()));
    }

    @When("I post the request with {string} payload twice")
    public void postwithPayloadtwice(String fileName) throws IOException {

        Configuration configuration = Configuration.builder().options(Option.SUPPRESS_EXCEPTIONS).build();
        File json = new File(Constants.JSONINPUT_DIR + fileName + ".json");
        String request = null;
        try {
            request = JsonPath.using(configuration).parse(json).jsonString();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            // Error handled silently - failure will be reported by test framework
        }
        apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.PAYLOAD.name(), request);
        apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.REQUEST_NAME.name(), fileName);
        apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.RESOURCE_URI.name(),
                ResourceURIS.getResourceURI(fileName));

        apiTestContext.getApiTestBase().specification.baseUri(RestAssuredUtils.baseURI);

        RestAssured.config = RestAssured.config().decoderConfig(DecoderConfig.decoderConfig().noContentDecoders());


        apiTestContext.getApiTestBase().response = RestAssuredUtils.post(apiTestContext.getApiTestBase().specification,
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.PAYLOAD.name()),
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()));

    }


    @When("I post the request with {string} payload with path parameter")
    public void postwithPayloadandPathParam(String fileName, DataTable dataTable) {


        List<Map<String, String>> table = dataTable.asMaps();

        Map<String, Object> pathParams = new HashMap<String, Object>();
        for (int i = 0; i < table.size(); i++) {
            String value = table.get(i).get("Value");
            if (value == null)
                value = "";
            pathParams.put(table.get(i).get("Path"), value);
        }

        if (apiTestContext.getApiTestBase().requestMap.isEmpty()) {
            Configuration configuration = Configuration.builder().options(Option.SUPPRESS_EXCEPTIONS).build();
            File json = new File(Constants.JSONINPUT_DIR + fileName + ".json");
            String request = null;
            try {
                request = JsonPath.using(configuration).parse(json).jsonString();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                // Error handled silently - failure will be reported by test framework
            }
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.PAYLOAD.name(), request);
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.REQUEST_NAME.name(), fileName);
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.RESOURCE_URI.name(),
                    ResourceURIS.getResourceURI(fileName));

            apiTestContext.getApiTestBase().specification.baseUri(RestAssuredUtils.baseURI);
            RestAssured.config = RestAssured.config().decoderConfig(DecoderConfig.decoderConfig().noContentDecoders());
        }

        apiTestContext.getApiTestBase().response = RestAssuredUtils.post(apiTestContext.getApiTestBase().specification,pathParams,
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.PAYLOAD.name()),
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()));

    }
    @When("I post the request with {string} payload with query parameter")
    public void postwithPayloadandQueryParam(String fileName, DataTable dataTable) {


        List<Map<String, String>> table = dataTable.asMaps();

        Map<String, Object> queryParams = new HashMap<String, Object>();
        for (int i = 0; i < table.size(); i++) {
            String value = table.get(i).get("Value");
            if (value == null)
                value = "";
            queryParams.put(table.get(i).get("Query"), value);
        }

        if (apiTestContext.getApiTestBase().requestMap.isEmpty()) {
            Configuration configuration = Configuration.builder().options(Option.SUPPRESS_EXCEPTIONS).build();
            File json = new File(Constants.JSONINPUT_DIR + fileName + ".json");
            String request = null;
            try {
                request = JsonPath.using(configuration).parse(json).jsonString();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                // Error handled silently - failure will be reported by test framework
            }
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.PAYLOAD.name(), request);
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.REQUEST_NAME.name(), fileName);
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.RESOURCE_URI.name(),
                    ResourceURIS.getResourceURI(fileName));

            apiTestContext.getApiTestBase().specification.baseUri(RestAssuredUtils.baseURI);
        }

        apiTestContext.getApiTestBase().response = RestAssuredUtils.post(apiTestContext.getApiTestBase().specification,
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.PAYLOAD.name()),
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()),queryParams);

    }

    @When("I post the request with {string} xml payload with query parameter")
    public void postwithXmlPayloadandQueryParam(String fileName, DataTable dataTable) {


        List<Map<String, String>> table = dataTable.asMaps();

        Map<String, Object> queryParams = new HashMap<String, Object>();
        for (int i = 0; i < table.size(); i++) {
            String value = table.get(i).get("Value");
            if (value == null)
                value = "";
            queryParams.put(table.get(i).get("Query"), value);
        }

        if (apiTestContext.getApiTestBase().requestMap.isEmpty()) {
            File xmlFile = new File(Constants.XMLINPUT_DIR + fileName + ".xml");
            String request = null;
            try {
                request = Files.readString(xmlFile.toPath(), StandardCharsets.UTF_8);
            } catch (IOException e) {
                // Error handled silently - failure will be reported by test framework
            }

            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.PAYLOAD.name(), request);
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.REQUEST_NAME.name(), fileName);
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.RESOURCE_URI.name(),
                    ResourceURIS.getResourceURI(fileName));

            apiTestContext.getApiTestBase().specification.baseUri(RestAssuredUtils.baseURI);
        }

        apiTestContext.getApiTestBase().response = RestAssuredUtils.post(apiTestContext.getApiTestBase().specification,
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.PAYLOAD.name()),
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()), queryParams);
    }

    @When("I post the request with {string} xml payload with dynamic access token and query parameters")
    public void postWithXmlPayloadDynamicAccessTokenAndQueryParam(String fileName, DataTable dataTable) {

        List<Map<String, String>> table = dataTable.asMaps();
        Map<String, Object> queryParams = new HashMap<String, Object>();
        for (int i = 0; i < table.size(); i++) {
            String paramName = table.get(i).get("Query");
            String paramValue = table.get(i).get("Value");

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
                resolvedValue = (paramValue != null) ? paramValue : "";
            }
            queryParams.put(paramName, resolvedValue);
        }
        if (apiTestContext.getApiTestBase().requestMap.isEmpty()) {
            File xmlFile = new File(Constants.XMLINPUT_DIR + fileName + ".xml");
            String request = null;
            try {
                request = Files.readString(xmlFile.toPath(), StandardCharsets.UTF_8);
            } catch (IOException e) {
                // Error handled silently - failure will be reported by test framework
            }
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.PAYLOAD.name(), request);
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.REQUEST_NAME.name(), fileName);
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.RESOURCE_URI.name(),
                    ResourceURIS.getResourceURI(fileName));
            apiTestContext.getApiTestBase().specification.baseUri(RestAssuredUtils.baseURI);
        }
        apiTestContext.getApiTestBase().response = RestAssuredUtils.post(
                apiTestContext.getApiTestBase().specification,
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.PAYLOAD.name()),
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()),
                queryParams);
    }

    @And("I post the request to endpoint")
    public void postRequest() {
        apiTestContext.getApiTestBase().response = RestAssuredUtils.post(apiTestContext.getApiTestBase().specification,
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.PAYLOAD.name()),
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()));
        RestAssured.config = RestAssured.config().decoderConfig(DecoderConfig.decoderConfig().noContentDecoders());

        try {
        }catch(Exception e) {
        }

    }
    @And("^I post the request to endpoint without encoded url$")
    public void postRequestWithoutEncoded() {
        // apiTestContext.getApiTestBase().specification.auth().oauth2("3b87b2db-f7df-4d18-a3ee-fbc16edac027");
        apiTestContext.getApiTestBase().response = RestAssuredUtils.post(
                apiTestContext.getApiTestBase().specification.urlEncodingEnabled(false),
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.PAYLOAD.name()),
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()));

    }

    @When("I send the POST request with {string} filepath to {string} endpoint with path parameters and with {string} formParameter")
    public void i_send_the_post_request_with_something_file_to_something_endpoint_with_path_parameters(String FilePath,
                                                                                                       String enPointName, String formParameters, DataTable dataTable) {

        String path = "src/test/resources/input_files/"+FilePath;
        File file = new File(path);

        List<Map<String, String>> table = dataTable.asMaps();
        Map<String, Object> pathParams = new HashMap<String, Object>();

        for(Map<String, String> map : table){
            String key = map.get("path");
            String value = map.get("value");
            pathParams.put(key,value);
        }

        if (apiTestContext.getApiTestBase().requestMap.isEmpty()) {
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.REQUEST_NAME.name(), formParameters);

            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.RESOURCE_URI.name(),
                    ResourceURIS.getResourceURI(enPointName));

            apiTestContext.getApiTestBase().specification.baseUri(RestAssuredUtils.baseURI);
        }

        //post(RequestSpecification specification, Map<String, Object> pathParam, String formParameter,String resourceURI,
        //       String FilePath)
        apiTestContext.getApiTestBase().response = RestAssuredUtils.post(apiTestContext.getApiTestBase().specification,
                pathParams, formParameters,
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()), file.getAbsolutePath());
    }

    @When("I send the POST request to \"([^\"]*)\" endpoint")
    public void postwithEndPoint(String endPointName) {

        if (apiTestContext.getApiTestBase().requestMap.isEmpty()) {
            Configuration configuration = Configuration.builder().options(Option.SUPPRESS_EXCEPTIONS).build();

            String request = null;

            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.PAYLOAD.name(), request);
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.RESOURCE_URI.name(),
                    ResourceURIS.getResourceURI(endPointName));

            apiTestContext.getApiTestBase().specification.baseUri(RestAssuredUtils.baseURI);
        }

        apiTestContext.getApiTestBase().response = RestAssuredUtils.post(apiTestContext.getApiTestBase().specification,

                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()));

    }



    @When("I send post request with {string} requestname and {string} jpath value from {string} response file and {string} jpath value from {string} response file")
    public void postwithPayloadWithChaindata1(String fileName,String path, String fileName0,String path1, String fileName1) throws ParseException, IOException {
        Configuration configuration = Configuration.builder().options(Option.SUPPRESS_EXCEPTIONS).build();
        //Map<String, Object> pathParams = new HashMap<String, Object>();
        String quote_idValue=null;
        String selected_quotation_id=null;
        File json = new File("./ResponseStore/" + fileName0 + ".json");
        String responseBody=null;

        try {
            responseBody = JsonPath.using(configuration).parse(json).jsonString();
            quote_idValue=String.valueOf(JsonUtils.getJSonObjectValue(responseBody, path));
            //pathParams.put("quote_id", quote_idValue);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            // Error handled silently - failure will be reported by test framework
        }
        File json1 = new File("./ResponseStore/" + fileName1 + ".json");
        String responseBody1=null;
        try {
            responseBody1 = JsonPath.using(configuration).parse(json1).jsonString();
            selected_quotation_id=String.valueOf(JsonUtils.getJSonObjectValue(responseBody1, path1));
            //pathParams.put("selected_quotation_id", selected_quotation_id);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            // Error handled silently - failure will be reported by test framework
        }
        File filepath = new File(Constants.JSONINPUT_DIR+ fileName+".json");

        FileReader reader = new FileReader(filepath);
        JSONParser jsonParser = new JSONParser();
        JSONObject jsonObject = (JSONObject) jsonParser.parse(reader);

        jsonObject.put("quote_id", quote_idValue);
        jsonObject.put("selected_quotation_id", selected_quotation_id);
        FileWriter file=new FileWriter(filepath);
        file.write(jsonObject.toJSONString());
        file.flush();
        file.close();

//  apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.REQUEST_NAME.name(), fileName);
//  apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.RESOURCE_URI.name(),
//        ResourceURIS.getResourceURI(fileName));
//
//apiTestContext.getApiTestBase().specification.baseUri(RestAssuredUtils.baseURI);
//apiTestContext.getApiTestBase().response = RestAssuredUtils.post(apiTestContext.getApiTestBase().specification,
//     pathParams, apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()));

        File jsonFile = new File(Constants.JSONINPUT_DIR + fileName + ".json");
        String request = null;
        try {
            request = JsonPath.using(configuration).parse(jsonFile).jsonString();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            // Error handled silently - failure will be reported by test framework
        }
        apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.PAYLOAD.name(), request);
        apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.REQUEST_NAME.name(), fileName);
        apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.RESOURCE_URI.name(),
                ResourceURIS.getResourceURI(fileName));

        apiTestContext.getApiTestBase().specification.baseUri(RestAssuredUtils.baseURI);


        apiTestContext.getApiTestBase().response = RestAssuredUtils.post(apiTestContext.getApiTestBase().specification,
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.PAYLOAD.name()),
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()));
        ReportManager.logInfoAPI(LocalDateTime.now().toString());
        ReportManager.logInfoAPI("<details><summary><font color=\"green\"><b>Click to view Response</b></font></summary><p><pre>"+apiTestContext.getApiTestBase().response.prettyPrint()+"</pre></script></p></details>");



    }
    @And("I send post request with {string} requestname and {string} jpath value as path parameter from {string} responsefile")
    public void getwithPayloadWithChaindata(String fileName, String jPaths, String responseFileName,
                                            DataTable dataTable) {
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

        File json = new File(Constants.JSONINPUT_DIR + fileName + ".json");
        String request = null;
        try {
            request = JsonPath.using(configuration).parse(json).jsonString();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            // Error handled silently - failure will be reported by test framework
        }
        apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.PAYLOAD.name(), request);
        apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.REQUEST_NAME.name(), fileName);
        apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.RESOURCE_URI.name(),
                ResourceURIS.getResourceURI(fileName));

        apiTestContext.getApiTestBase().specification.baseUri(RestAssuredUtils.baseURI);

        apiTestContext.getApiTestBase().response = RestAssuredUtils.post(apiTestContext.getApiTestBase().specification,
                pathParams, apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.PAYLOAD.name()),
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()));
        ReportManager.logInfoAPI(apiTestContext.getApiTestBase().response.asString());

    }
    @When("I send the POST request with {string} ExcelFilepath  to {string} endpoint and {string} formType")

    public void i_send_the_post_request_with_something_Excelfile_to_something_endpoint(String FilePath,
                                                                                       String enPointName, String formType) {

        String path = "src/test/resources/InputFiles/" + FilePath;

        File file = new File(path);

        Map<String, Object> pathParams = new HashMap<String, Object>();

        if (apiTestContext.getApiTestBase().requestMap.isEmpty()) {

            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.RESOURCE_URI.name(),

                    ResourceURIS.getResourceURI(enPointName));

            apiTestContext.getApiTestBase().specification.baseUri(RestAssuredUtils.baseURI);

        }

        apiTestContext.getApiTestBase().response = RestAssuredUtils.postwithExcel(
                apiTestContext.getApiTestBase().specification,

                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()),

                file.getAbsolutePath(), formType);

//     ReportManager.logInfoAPI(
//           "<details><summary><font color=\"green\"><b>Click to view Response</b></font></summary><p><pre>"
//                 + apiTestContext.getApiTestBase().response.asString() + "</pre></script></p></details>");

//     ReportManager.logInfoAPI(apiTestContext.getApiTestBase().response.asString());

    }


    @When("I send the POST request with {string} filepath to {string} endpoint")
    public void i_send_the_post_request_with_something_file_to_something_endpoint(String FilePath,
                                                                                  String enPointName,DataTable dataTable) {

        String path = "src/test/resources/InputFiles/"+FilePath;
        File file = new File(path);

        List<Map<String, String>> table = dataTable.asMaps();
        Map<String, Object> formParams = new HashMap<String, Object>();
        
        // Process form parameters from DataTable
        for (Map<String, String> row : table) {
            String formKey = row.get("FormKey");
            String formValue = row.get("FormValue");
            
            // Handle dynamic values
            if ("randomString".equalsIgnoreCase(formValue)) {
                formValue = RandomGenerator.randomString(8);
            } else if ("randomPhoneNumber".equalsIgnoreCase(formValue)) {
                formValue = "9" + RandomGenerator.randomInteger(9);
            }
            
            formParams.put(formKey, formValue);
        }

        if (apiTestContext.getApiTestBase().requestMap.isEmpty()) {
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.RESOURCE_URI.name(),
                    ResourceURIS.getResourceURI(enPointName));
            apiTestContext.getApiTestBase().specification.baseUri(RestAssuredUtils.baseURI);
        }

        // Send multipart form data request
        apiTestContext.getApiTestBase().response = RestAssuredUtils.post(
                apiTestContext.getApiTestBase().specification,
                formParams,
                "file",
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()),
                file.getAbsolutePath());
        
    }

    @When("I send the POST request with {string} filepath to {string} endpoint with path parameter")
    public void i_send_the_post_request_with_something_file_to_something_endpoint_with_pathParam(String FilePath,
                                                                                  String enPointName,DataTable dataTable) {

        String path = "src/test/resources/InputFiles/" + FilePath;
        File file = new File(path);

        List<Map<String, String>> table = dataTable.asMaps();
        Map<String, Object> formParams = new HashMap<String, Object>();

        // Process form parameters from DataTable
        for (Map<String, String> row : table) {
            String formKey = row.get("FormKey");
            String formValue = row.get("FormValue");

            // Handle dynamic values
            if ("randomString".equalsIgnoreCase(formValue)) {
                formValue = RandomGenerator.randomString(8);
            } else if ("randomPhoneNumber".equalsIgnoreCase(formValue)) {
                formValue = "9" + RandomGenerator.randomInteger(9);
            }

            formParams.put(formKey, formValue);
        }

        Map<String, Object> pathParams = new HashMap<String, Object>();
        for (int i = 0; i < table.size(); i++) {
            String value = table.get(i).get("Value");
            if (value == null)
                value = "";
            else if (value != null && value.startsWith("DB:")) {
                // Expected format: DB:tableName:col1,col2:whereClause
                String[] parts = value.split(":", 4);
                String tableName = parts[1];
                List<String> cols = Arrays.asList(parts[2].split(","));
                String whereClause = parts.length > 3 ? parts[3] : null;

                List<Map<String, Object>> dbData = DBUtil.getData(tableName, cols, whereClause);
                if (!dbData.isEmpty()) {
                    // If single column requested → just pick first row/col
                    if (cols.size() == 1) {
                        value = String.valueOf(dbData.get(0).get(cols.get(0)));
                    } else {
                        // If multiple columns, you might need JSON merge instead
                        value = dbData.get(0).toString();
                    }
                } else {
                    throw new RuntimeException("No DB data found for: " + value);
                }
                pathParams.put(table.get(i).get("Path"), value);
            }

            if (apiTestContext.getApiTestBase().requestMap.isEmpty()) {
                apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.RESOURCE_URI.name(),
                        ResourceURIS.getResourceURI(enPointName));
                apiTestContext.getApiTestBase().specification.baseUri(RestAssuredUtils.baseURI);
            }

            // Send multipart form data request
            apiTestContext.getApiTestBase().response = RestAssuredUtils.post(
                    apiTestContext.getApiTestBase().specification, pathParams,
                    formParams,
                    "file",
                    apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()),
                    file.getAbsolutePath());

        }
    }
    @When("I send the POST request with {string} filepath to {string} endpoint and follow redirection to {string} endpoint")
    public void sendPostRequestWithRedirection(String FilePath, String enPointName, String redirectEndpointName, DataTable dataTable) {
        String path = "src/test/resources/InputFiles/" + FilePath;
        File file = new File(path);

        List<Map<String, String>> table = dataTable.asMaps();
        Map<String, Object> formParams = new HashMap<String, Object>();
        
        // Process form parameters from DataTable
        for (Map<String, String> row : table) {
            String formKey = row.get("FormKey");
            String formValue = row.get("FormValue");
            
            // Handle dynamic values
            if ("randomString".equalsIgnoreCase(formValue)) {
                formValue = RandomGenerator.randomString(8);
            } else if ("randomPhoneNumber".equalsIgnoreCase(formValue)) {
                formValue = "9" + RandomGenerator.randomInteger(9);
            }
            
            formParams.put(formKey, formValue);
        }

        if (apiTestContext.getApiTestBase().requestMap.isEmpty()) {
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.RESOURCE_URI.name(),
                    ResourceURIS.getResourceURI(enPointName));
            apiTestContext.getApiTestBase().specification.baseUri(RestAssuredUtils.baseURI);
        }

        // Send multipart form data request
        apiTestContext.getApiTestBase().response = RestAssuredUtils.post(
                apiTestContext.getApiTestBase().specification,
                formParams,
                "file",
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()),
                file.getAbsolutePath());
        
        
        // Check if we got a 302 redirect
        if (apiTestContext.getApiTestBase().response.statusCode() == 302) {
            String locationHeader = apiTestContext.getApiTestBase().response.getHeader("Location");
            
            // Follow the redirection to the specified endpoint
            if (locationHeader != null) {
                // Send GET request to the redirect endpoint to complete the process
                apiTestContext.getApiTestBase().response = RestAssuredUtils.get(
                        apiTestContext.getApiTestBase().specification,
                        ResourceURIS.getResourceURI(redirectEndpointName));
                
            }
        }
    }

    @When("I send the POST request with {string} filepath to {string} endpoint with path parameter and follow redirection to {string} endpoint")
    public void sendPostRequestWithRedirectionAlongWithPathParams(String FilePath, String enPointName, String redirectEndpointName, DataTable dataTable) {
        String path = "src/test/resources/InputFiles/" + FilePath;
        File file = new File(path);

        List<Map<String, String>> table = dataTable.asMaps();
        Map<String, Object> formParams = new HashMap<String, Object>();

        // Process form parameters from DataTable
        for (Map<String, String> row : table) {
            String formKey = row.get("FormKey");
            String formValue = row.get("FormValue");

            // Handle dynamic values
            if ("randomString".equalsIgnoreCase(formValue)) {
                formValue = RandomGenerator.randomString(8);
            } else if ("randomPhoneNumber".equalsIgnoreCase(formValue)) {
                formValue = "9" + RandomGenerator.randomInteger(9);
            }

            formParams.put(formKey, formValue);
        }

        Map<String, Object> pathParams = new HashMap<String, Object>();
        for (int i = 0; i < table.size(); i++) {
            String value = table.get(i).get("Value");
            if (value == null)
                value = "";
            else if (value != null && value.startsWith("DB:")) {
                // Expected format: DB:tableName:col1,col2:whereClause
                String[] parts = value.split(":", 4);
                String tableName = parts[1];
                List<String> cols = Arrays.asList(parts[2].split(","));
                String whereClause = parts.length > 3 ? parts[3] : null;

                List<Map<String, Object>> dbData = DBUtil.getData(tableName, cols, whereClause);
                if (!dbData.isEmpty()) {
                    // If single column requested → just pick first row/col
                    if (cols.size() == 1) {
                        value = String.valueOf(dbData.get(0).get(cols.get(0)));
                    } else {
                        // If multiple columns, you might need JSON merge instead
                        value = dbData.get(0).toString();
                    }
                } else {
                    throw new RuntimeException("No DB data found for: " + value);
                }
                pathParams.put(table.get(i).get("Path"), value);
            }

            if (apiTestContext.getApiTestBase().requestMap.isEmpty()) {
                apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.RESOURCE_URI.name(),
                        ResourceURIS.getResourceURI(enPointName));
                apiTestContext.getApiTestBase().specification.baseUri(RestAssuredUtils.baseURI);
            }

            // Send multipart form data request
            apiTestContext.getApiTestBase().response = RestAssuredUtils.post(
                    apiTestContext.getApiTestBase().specification, pathParams,
                    formParams,
                    "file",
                    apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()),
                    file.getAbsolutePath());


            // Check if we got a 302 redirect
            if (apiTestContext.getApiTestBase().response.statusCode() == 302) {
                String locationHeader = apiTestContext.getApiTestBase().response.getHeader("Location");

                // Follow the redirection to the specified endpoint
                if (locationHeader != null) {
                    // Send GET request to the redirect endpoint to complete the process
                    apiTestContext.getApiTestBase().response = RestAssuredUtils.get(
                            apiTestContext.getApiTestBase().specification,
                            ResourceURIS.getResourceURI(redirectEndpointName));

                }
            }
        }
    }

    @When("I send the POST request with {string} filepath to {string} endpoint and follow redirection")
    public void sendPostRequestWithAutoRedirection(String FilePath, String enPointName, DataTable dataTable) {
        String path = "src/test/resources/InputFiles/" + FilePath;
        File file = new File(path);

        List<Map<String, String>> table = dataTable.asMaps();
        Map<String, Object> formParams = new HashMap<String, Object>();
        
        // Process form parameters from DataTable
        for (Map<String, String> row : table) {
            String formKey = row.get("FormKey");
            String formValue = row.get("FormValue");
            
            // Handle dynamic values
            if ("randomString".equalsIgnoreCase(formValue)) {
                formValue = RandomGenerator.randomString(8);
            } else if ("randomPhoneNumber".equalsIgnoreCase(formValue)) {
                formValue = "9" + RandomGenerator.randomInteger(9);
            }
            
            formParams.put(formKey, formValue);
        }

        if (apiTestContext.getApiTestBase().requestMap.isEmpty()) {
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.RESOURCE_URI.name(),
                    ResourceURIS.getResourceURI(enPointName));
            apiTestContext.getApiTestBase().specification.baseUri(RestAssuredUtils.baseURI);
        }

        // Send multipart form data request
        apiTestContext.getApiTestBase().response = RestAssuredUtils.post(
                apiTestContext.getApiTestBase().specification,
                formParams,
                "file",
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()),
                file.getAbsolutePath());
        
        
        // Check if we got a 302 redirect
        if (apiTestContext.getApiTestBase().response.statusCode() == 302) {
            String locationHeader = apiTestContext.getApiTestBase().response.getHeader("Location");
            
            // Follow the redirection automatically
            if (locationHeader != null) {
                // Extract the endpoint from the location header
                String redirectPath = locationHeader.startsWith("/") ? locationHeader : "/" + locationHeader;
                
                // Send GET request to the redirect location
                apiTestContext.getApiTestBase().response = RestAssuredUtils.get(
                        apiTestContext.getApiTestBase().specification,
                        redirectPath);
                
            }
        }
    }

    @When("I hit request to post endpoint with json field {string} value from a payload {string} as path params")
    public void i_hit_the_post_request_to_something_endpoint_with_path_params(String jpath, String fileName,
                                                                              DataTable dataTable) throws Throwable {
        List<Map<String, String>> table = dataTable.asMaps();
        Configuration configuration = Configuration.builder().options(Option.SUPPRESS_EXCEPTIONS).build();
        File json = new File("./ResponseStore/" + fileName + ".json");
        String request = null;
        try {
            request = JsonPath.using(configuration).parse(json).jsonString();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            // Error handled silently - failure will be reported by test framework
        }

        String value = String.valueOf(JsonUtils.getJSonObjectValue(request, jpath));
        Map<String, Object> pathParams = new HashMap<String, Object>();
        for (int i = 0; i < table.size(); i++) {

            pathParams.put(table.get(i).get("Path"), value);
        }
        apiTestContext.getApiTestBase().response = RestAssuredUtils.post(apiTestContext.getApiTestBase().specification,
                pathParams, apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.PAYLOAD.name()),
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()));
    }

    @When("I post the request with {string} payload with dynamic access token and query parameters")
    public void postWithPayloadDynamicAccessTokenAndQueryParam(String fileName, DataTable dataTable) {
        List<Map<String, String>> table = dataTable.asMaps();
        Map<String, Object> queryParams = new HashMap<String, Object>();

        for (int i = 0; i < table.size(); i++) {
            String paramName = table.get(i).get("Query");
            String paramValue = table.get(i).get("Value");
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
                resolvedValue = (paramValue != null) ? paramValue : "";
            }
            queryParams.put(paramName, resolvedValue);
        }
        if (apiTestContext.getApiTestBase().requestMap.isEmpty()) {
            Configuration configuration = Configuration.builder().options(Option.SUPPRESS_EXCEPTIONS).build();
            File json = new File(Constants.JSONINPUT_DIR + fileName + ".json");
            String request = null;
            try {
                request = JsonPath.using(configuration).parse(json).jsonString();
            } catch (IOException e) {
                // Error handled silently - failure will be reported by test framework
            }

            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.PAYLOAD.name(), request);
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.REQUEST_NAME.name(), fileName);
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.RESOURCE_URI.name(),
                    ResourceURIS.getResourceURI(fileName));

            apiTestContext.getApiTestBase().specification.baseUri(RestAssuredUtils.baseURI);
        }
        apiTestContext.getApiTestBase().response = RestAssuredUtils.post(
                apiTestContext.getApiTestBase().specification,
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.PAYLOAD.name()),
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()),
                queryParams);
    }

    @When("I post the request with {string} payload with path parameter and dynamic access token and query parameters")
    public void postWithPayloadPathParamAndQueryParam(String fileName, DataTable dataTable) {
        List<Map<String, String>> table = dataTable.asMaps();
        Map<String, Object> pathParams = new HashMap<String, Object>();
        Map<String, Object> queryParams = new HashMap<String, Object>();

        for (int i = 0; i < table.size(); i++) {
            // Handle query parameters (QueryParamName, QueryParamValue)
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
                    resolvedValue = (paramValue != null) ? paramValue : "";
                }
                queryParams.put(paramName, resolvedValue);
            }
            
            // Handle path parameters (Path, Value)
            if (table.get(i).get("Path") != null) {
                String pathName = table.get(i).get("Path");
                String pathValue = table.get(i).get("Value");
                String resolvedPathValue = (pathValue != null) ? pathValue : "";
                pathParams.put(pathName, resolvedPathValue);
            }
        }

        if (apiTestContext.getApiTestBase().requestMap.isEmpty()) {
            Configuration configuration = Configuration.builder().options(Option.SUPPRESS_EXCEPTIONS).build();
            File json = new File(Constants.JSONINPUT_DIR + fileName + ".json");
            String request = null;
            try {
                request = JsonPath.using(configuration).parse(json).jsonString();
            } catch (IOException e) {
                // Error handled silently - failure will be reported by test framework
            }
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.PAYLOAD.name(), request);
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.REQUEST_NAME.name(), fileName);
            apiTestContext.getApiTestBase().requestMap.put(WS_PayloadsHeaders.RESOURCE_URI.name(),
                    ResourceURIS.getResourceURI(fileName));

            apiTestContext.getApiTestBase().specification.baseUri(RestAssuredUtils.baseURI);
            RestAssured.config = RestAssured.config().decoderConfig(DecoderConfig.decoderConfig().noContentDecoders());
        }

        apiTestContext.getApiTestBase().response = RestAssuredUtils.post(
                apiTestContext.getApiTestBase().specification,
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.PAYLOAD.name()),
                pathParams,
                apiTestContext.getApiTestBase().requestMap.get(WS_PayloadsHeaders.RESOURCE_URI.name()),
                queryParams);
    }

}

