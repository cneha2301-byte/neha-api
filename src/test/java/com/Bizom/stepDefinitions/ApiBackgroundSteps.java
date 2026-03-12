package com.Bizom.stepDefinitions;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.Bizom.commonUtils.DBUtil;
import com.jayway.jsonpath.Configuration;
import com.jayway.jsonpath.JsonPath;
import com.Bizom.api.Base.TestContext;
import com.Bizom.commonUtils.ConfigReader;
import com.Bizom.commonUtils.JsonUtils;
import com.Bizom.commonUtils.RestAssuredUtils;

import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import org.testng.Assert;

/*
 * All API Specifications, Authentications, Headers should be added here in step methods
 */

public class ApiBackgroundSteps {

    private TestContext apiTestContext;

    public ApiBackgroundSteps(TestContext apiTestContext) {
        this.apiTestContext = apiTestContext;
    }
//  @And("I Set Up API Key for OMNI Small Ticket")
//  public void setApiKeyCrosssell() throws Throwable {
//
//     Map<String, String> HeaderMaps = new HashMap<String, String>();
//
//     String token = ConfigReader.getValue("omni_Small_Ticket");
//     HeaderMaps.put("api-key", token);
//     if (apiTestContext.getApiTestBase().specification == null) {
//        apiTestContext.getApiTestBase().specification = RestAssuredUtils.getSpec().build();
//     }
//     apiTestContext.getApiTestBase().specification.headers(HeaderMaps);
//  }


    /*
     * Method to set up request specification or add header input - Request Headers
     * as data table
     */
    @Given("^(?:I set up request specification|I add request headers|I add new headers)$")
    public void setUpSpecification(DataTable dataTable) throws Throwable {
        List<Map<String, String>> table = dataTable.asMaps();
        Map<String, String> HeaderMaps = new HashMap<String, String>();
        for (int row = 0; row < table.size(); row++) {
            HeaderMaps.put(table.get(row).get("HeaderName").trim(), table.get(row).get("HeaderValue").trim());
        }
        if (apiTestContext.getApiTestBase().specification == null) {
            apiTestContext.getApiTestBase().specification = RestAssuredUtils.getSpec().build();
        }
        apiTestContext.getApiTestBase().specification.headers(HeaderMaps);
    }

    /*
     * Method to set up request specification or add header input - Request cookies
     * as data table
     */
    @And("^I set cookies$")
    public void setCookies(DataTable dataTable) {
        List<Map<String, String>> table = dataTable.asMaps();
        Map<String, String> cookieMaps = new HashMap<String, String>();
        for (int row = 0; row < table.size(); row++) {
            cookieMaps.put(table.get(row).get("cookieName"), table.get(row).get("cookieValue"));
        }
        if (apiTestContext.getApiTestBase().specification == null) {
            apiTestContext.getApiTestBase().specification = RestAssuredUtils.getSpec().build();
        }
        apiTestContext.getApiTestBase().specification.cookies(cookieMaps);
    }

    @And("^I add basic authentication$")
    public void setBasicAuthentication(String username, String password) {
        if (apiTestContext.getApiTestBase().specification == null) {
            apiTestContext.getApiTestBase().specification = RestAssuredUtils.getSpec().build();
        }

        apiTestContext.getApiTestBase().specification.auth().preemptive().basic(username, password);
    }
    @And("^I add digest authentication$")
    public void setDigestAuthentication(String username, String password) {
        if (apiTestContext.getApiTestBase().specification == null) {
            apiTestContext.getApiTestBase().specification = RestAssuredUtils.getSpec().build();
        }
        apiTestContext.getApiTestBase().specification.auth().digest(username, password);

    }

    @And("^I add oauth2 authentication \"([^\"]*)\"$")
    public void setOauth2Authentication(String accessToken) {
        if (apiTestContext.getApiTestBase().specification == null) {
            apiTestContext.getApiTestBase().specification = RestAssuredUtils.getSpec().build();
        }
        apiTestContext.getApiTestBase().specification.auth().oauth2(accessToken);
    }

    @And("I Set Up Authorization Token")
    public void setUpToken() throws Throwable {

        Map<String, String> HeaderMaps = new HashMap<String, String>();

        String token = "JWT"+ConfigReader.getValue("AuthorizationToken");
        HeaderMaps.put("Authorization", token);
        if (apiTestContext.getApiTestBase().specification == null) {
            apiTestContext.getApiTestBase().specification = RestAssuredUtils.getSpec().build();
        }
        apiTestContext.getApiTestBase().specification.headers(HeaderMaps);

    }

    @And("I Set Up Authorization Token with chain value")
    public void setUpTokenWithChainValue() throws Throwable {

        Map<String, String> HeaderMaps = new HashMap<String, String>();

        String token = "JWT "+ApiRequestModificationSteps.str_data;
        HeaderMaps.put("Authorization", token);
        if (apiTestContext.getApiTestBase().specification == null) {
            apiTestContext.getApiTestBase().specification = RestAssuredUtils.getSpec().build();
        }
        apiTestContext.getApiTestBase().specification.headers(HeaderMaps);

    }

    @And("I Set Up Invalid Authorization Token")
    public void setUpInvalidToken() throws Throwable {

        Map<String, String> HeaderMaps = new HashMap<String, String>();

        String invalidToken = ConfigReader.getValue("InvalidAuthorizationToken");
        HeaderMaps.put("Authorization", invalidToken);
        if (apiTestContext.getApiTestBase().specification == null) {
            apiTestContext.getApiTestBase().specification = RestAssuredUtils.getSpec().build();
        }
        apiTestContext.getApiTestBase().specification.headers(HeaderMaps);
    }

    @And("I Set Up Authorization Token Create Payment")
    public void setUpCreatePaymentToken() throws Throwable {

        Map<String, String> HeaderMaps = new HashMap<String, String>();

        String createPaymentToken = ConfigReader.getValue("AuthorizationTokenCreatePayment");
        HeaderMaps.put("Authorization", createPaymentToken);
        if (apiTestContext.getApiTestBase().specification == null) {
            apiTestContext.getApiTestBase().specification = RestAssuredUtils.getSpec().build();
        }
        apiTestContext.getApiTestBase().specification.headers(HeaderMaps);
    }

    @And("I Set Up Authorization Token Account Access")
    public void setUpAccountAccessToken() throws Throwable {

        Map<String, String> HeaderMaps = new HashMap<String, String>();

        String accountAccessToken = ConfigReader.getValue("AuthorizationTokenAccountAccess");
        HeaderMaps.put("Authorization", accountAccessToken);
        if (apiTestContext.getApiTestBase().specification == null) {
            apiTestContext.getApiTestBase().specification = RestAssuredUtils.getSpec().build();
        }
        apiTestContext.getApiTestBase().specification.headers(HeaderMaps);
    }



    @Given("I set up base URI for transactions")
    public void baseUriForTransactions() throws Throwable {
        //RestAssuredUtils.baseURI="https://vlmsfloratxnsapi.logicloop.io/flora/transactions/apis/";
        String executionBase = System.getProperty("executionBase");

        if (executionBase == null || executionBase.isEmpty()) {
            throw new IllegalArgumentException("executionBase parameter is required. " +
                    "Use -DexecutionBase=<value> when running Maven.");
        } else {
            switch (executionBase.toLowerCase()) {
                case "bizomweb":
                    RestAssuredUtils.baseURI = ConfigReader.getValue("bizomWebApiBaseUri");
                    break;

                case "integration":
                    RestAssuredUtils.baseURI = ConfigReader.getValue("integrationApiBaseUri");
                    break;

                case "retailer":
                    RestAssuredUtils.baseURI = ConfigReader.getValue("retailerApiBaseUri");
                    break;

                default:
                    throw new IllegalArgumentException("Invalid executionBase value: " + executionBase.toUpperCase());
            }
        }

    }
    @And("I set cookies using {string} name jpath and {string} value jpath from {string} file")
    public void setCookiesUsingJsonFile(String nameJPath,String valueJPath,String fileName) {

        Configuration configuration = Configuration.builder().build();
        File json = new File("./ResponseStore/" + fileName + ".json");
        String responseBody;
        try {
            responseBody = JsonPath.using(configuration).parse(json).jsonString();
            Map<String, String> cookieMaps = new HashMap<String, String>();
            String cookieName = String.valueOf(JsonUtils.getJSonObjectValue(responseBody, nameJPath));
            String cookieValue= String.valueOf(JsonUtils.getJSonObjectValue(responseBody, valueJPath));
            cookieMaps.put(cookieName,cookieValue);

            if (apiTestContext.getApiTestBase().specification == null) {
                apiTestContext.getApiTestBase().specification = RestAssuredUtils.getSpec().build();
            }
            apiTestContext.getApiTestBase().specification.cookies(cookieMaps);


        } catch (IOException e) {
            // TODO Auto-generated catch block
            // Error handled silently - failure will be reported by test framework
        }

    }

    @Given("I update the following columns in {string} table where {string}")
    public void updateTableData(String tableName, String whereClause, DataTable dataTable) {
        List<Map<String, String>> rows = dataTable.asMaps(String.class, String.class);
        Map<String, Object> updateMap = new HashMap<>();

        for (Map<String, String> row : rows) {
            updateMap.put(row.get("column"), row.get("value"));
        }

        int updated = DBUtil.updateData(tableName, updateMap, whereClause);
        Assert.assertTrue(updated > 0,"No rows were updated!" );
    }

}
    
